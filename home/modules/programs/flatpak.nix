{ ... }:
{
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "CianovaLauncher";
        location = "https://plagaplusdev.github.io/CianovaLauncher-mcpelauncher/CianovaLauncher.flatpakrepo";
      }
    ];

    packages = [
      {
        appId = "org.cianova.Launcher";
        origin = "CianovaLauncher";
      }

      "org.kde.Platform//5.15-24.08"
      "io.qt.qtwebengine.BaseApp//5.15-24.08"
    ];
    update.onActivation = true;
  };
}
