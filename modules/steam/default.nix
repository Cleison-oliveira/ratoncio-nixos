{ ... }:
{
  imports = [
    ../hardware-configuration
  ];

  specialisation = {
    steamos = {
      inheritParentConfig = false;
      configuration = {

        imports = [
          ../hardware-configuration
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
