{ ... }:
{
  imports = [
    ../hardware-configuration.nix
  ];

  specialisation = {
    steamos = {
      inheritParentConfig = false;
      configuration = {

        imports = [
          ../hardware-configuration.nix
          ../../users/steam
          ../window-manager
          ../sys-packages
          ./gaming
          ../fish
          ../security
          ../networking
          ./configuration
          ../fonts
        ];
      };
    };
  };
}
