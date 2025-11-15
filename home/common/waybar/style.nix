''
  * {
    font-family: "Ubuntu NF";
    font-size: 12px;
  }
  window#waybar {
    background-color: #1d1d2d;
    color: #ffffff;
    transition: none;
  }
  window#waybar.hidden {
    opacity: 0.2;
  }
  button {
    box-shadow: none;
    border: none;
    border-radius: 0;
  }
  button:hover {
    background: inherit;
  }
  #workspaces button {
    background-color: #313244;
    color: #89b4fa;
    margin: 4px 2px;
    padding: 3px 6px;
    border-radius: 6px;
    min-width: 30px;
  }
  #workspaces button:hover {
    background: #45475a;
    color: #89b4fa;
  }
  #workspaces button.active {
    color: #1d1d2d;
    background-color: #89b4fa;
  }
  #workspaces button.focused {
    color: #89b4fa;
    background-color: #313244;
  }
  #workspaces button.urgent {
    background-color: #f38ba8;
    color: #1d1d2d;
  }
  #clock,
  #cpu,
  #memory,
  #disk,
  #pulseaudio,
  #tray,
  #mode,
  #window {
    margin: 4px 2px;
    padding: 3px 8px;
    border-radius: 6px;
  }
  #clock {
    background-color: #89b4fa;
    color: #1d1d2d;
  }
  #cpu {
    background-color: #89dceb;
    color: #1d1d2d;
  }
  #cpu:hover {
    background-color: #313244;
    color: #89b4fa;
  }
  #memory {
    background-color: #a6e3a1;
    color: #1d1d2d;
  }
  #memory:hover {
    background-color: #313244;
    color: #89b4fa;
  }
  #disk {
    background-color: #fec7cd;
    color: #1d1d2d;
  }
  #disk:hover {
    background-color: #313244;
    color: #89b4fa;
  }
  #pulseaudio {
    background-color: #f9e2af;
    color: #000000;
  }
  #pulseaudio:hover {
    background-color: #313244;
    color: #89b4fa;
  }
  #pulseaudio.muted {
    background-color: #585b70;
    color: #cdd6f4;
  }
  #tray {
    background-color: #1d1d2d;
  }
  #tray>.passive {
    -gtk-icon-effect: dim;
  }
  #tray>.needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
  }
  #mode {
    background-color: #64727D;
  }
  label:focus {
    background-color: #000000;
  }
''
