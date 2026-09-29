{inputs, ...}: {
  flake-file.inputs.comfyui-nix = {
    url = "github:utensils/comfyui-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.desktop-comfyui = {pkgs, ...}: {
    imports = [
      inputs.comfyui-nix.nixosModules.default
    ];

    nixpkgs.overlays = [
      (final: prev: {
        pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
          (pyFinal: pyPrev: {
            # Pre-built PyPI wheel to avoid lengthy C++ compilation of onnxruntime
            onnxruntime = pyPrev.buildPythonPackage {
              pname = "onnxruntime";
              version = "1.20.1";
              format = "wheel";
              src = prev.fetchurl {
                url = "https://files.pythonhosted.org/packages/47/42/2f71f5680834688a9c81becbe5c5bb996fd33eaed5c66ae0606c3b1d6a02/onnxruntime-1.20.1-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl";
                sha256 = "bb71a814f66517a65628c9e4a2bb530a6edd2cd5d87ffa0af0f6f773a027d99e";
              };
              nativeBuildInputs = [
                prev.autoPatchelfHook
              ];
              buildInputs = [
                prev.stdenv.cc.cc.lib
                prev.zlib
              ];
              propagatedBuildInputs = with pyPrev; [
                coloredlogs
                flatbuffers
                numpy
                packaging
                protobuf
                sympy
              ];
              doCheck = false;
              doInstallCheck = false;
            };

            # Disable broken pytest timeout tests on upstream jupyter-server
            jupyter-server = pyPrev.jupyter-server.overridePythonAttrs (_: {
              doCheck = false;
              doInstallCheck = false;
              nativeCheckInputs = [];
              disabledTests = [];
            });
          })
        ];
      })
    ];

    services.comfyui = {
      enable = true;
      gpuSupport = "cuda";
      enableManager = true;
      port = 8188;
      listenAddress = "127.0.0.1";
      environment = {
        CUDA_VISIBLE_DEVICES = "0";
        NVIDIA_VISIBLE_DEVICES = "all";
        NVIDIA_DRIVER_CAPABILITIES = "compute,utility,graphics";
        __NV_PRIME_RENDER_OFFLOAD = "1";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        __VK_LAYER_NV_optimus = "NVIDIA_only";
        DRI_PRIME = "1";
        HIP_VISIBLE_DEVICES = "-1";
        ROCR_VISIBLE_DEVICES = "";
        PYTORCH_CUDA_ALLOC_CONF = "expandable_segments:True";
      };
      extraArgs = [
        "--cuda-device"
        "0"
        "--highvram"
      ];
      package = let
        versions = import "${inputs.comfyui-nix}/nix/versions.nix";
        prebuiltNccl = pkgs.stdenv.mkDerivation {
          pname = "cuda-nccl-prebuilt";
          version = "2.32.3";
          src = pkgs.fetchurl {
            url = "https://files.pythonhosted.org/packages/5b/29/6b277e63c92d91f9cb4d1a3a554e148983de39d54baa652bb52c798af78e/nvidia_nccl_cu13-2.32.3-py3-none-manylinux_2_27_x86_64.whl";
            sha256 = "1459723080ac889d73a26edfa3e04383a7928ab31ac8f0ec43b3ea9548b04ff3";
          };
          nativeBuildInputs = [
            pkgs.unzip
            pkgs.autoPatchelfHook
          ];
          buildInputs = [
            pkgs.stdenv.cc.cc.lib
          ];
          unpackPhase = "unzip -q $src";
          installPhase = ''
            mkdir -p $out/lib $out/include
            cp -r nvidia/nccl/lib/* $out/lib/
            cp -r nvidia/nccl/include/* $out/include/ || true
            ln -sf libnccl.so.2 $out/lib/libnccl.so || true
          '';
          dontBuild = true;
          dontConfigure = true;
          doCheck = false;
        };
        ncclPkg = prebuiltNccl // {
          out = prebuiltNccl;
          dev = prebuiltNccl;
          static = prebuiltNccl;
        };
        pkgsWithoutNvshmem = pkgs // {
          stdenv = pkgs.stdenv // {
            isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
          };
          cudaPackages_13 = pkgs.cudaPackages_13 // {
            libnvshmem = pkgs.emptyDirectory;
            nccl = ncclPkg;
          };
          cudaPackages = pkgs.cudaPackages // {
            libnvshmem = pkgs.emptyDirectory;
            nccl = ncclPkg;
          };
        };
        basePythonOverrides = import "${inputs.comfyui-nix}/nix/python-overrides.nix" {
          pkgs = pkgsWithoutNvshmem;
          inherit versions;
          gpuSupport = "cuda";
        };
        pythonOverrides = final: prev: let
          base = basePythonOverrides final prev;
        in
          base
          // {
            torch = base.torch.overridePythonAttrs (old: {
              nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.stdenv.cc];
              postInstall = (old.postInstall or "") + ''
                find "$out" -name "libtorch_nvshmem.so" -execdir ${pkgs.stdenv.cc}/bin/c++ -shared -fPIC -x c++ - -o libtorch_nvshmem.so <<< 'extern "C" { bool _ZN4c10d17nvshmem_extension20is_nvshmem_availableEv() { return false; } void _ZN4c10d17nvshmem_extension22nvshmemx_cumodule_initEm(unsigned long) {} }' \;
              '';
            });
          };
      in
        (import "${inputs.comfyui-nix}/nix/packages.nix" {
          inherit (pkgs) lib;
          pkgs = pkgsWithoutNvshmem;
          inherit versions pythonOverrides;
          gpuSupport = "cuda";
        })
        .default;
    };
  };
}
