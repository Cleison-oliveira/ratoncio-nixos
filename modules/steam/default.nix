{ ... }:
{
  imports = [
    ../hardware
  ];

  specialisation = {
    steamos = {
      inheritParentConfig = false;
      configuration = {
        imports = [
          ../hardware
          ../../users/steam
          ../window-manager
          ../packages
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
