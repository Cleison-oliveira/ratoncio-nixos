{ ... }:
{
  services.picom = {
    enable = true;
    backend = "egl";
    fade = false;
    shadow = false;
    settings = {
      use_damage = true;
    };
  };
}
