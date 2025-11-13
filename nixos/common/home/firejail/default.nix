{ ... }: {

  home = {
    file = {
      ".config/firejail/telegram.profile".text =
        builtins.readFile ./telegram.profile;

      ".config/firejail/browser.profile".text =
        builtins.readFile ./browser.profile;
    };
  };
}
