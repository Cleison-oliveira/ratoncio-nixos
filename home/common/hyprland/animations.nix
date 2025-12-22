{
  enabled = true;

  bezier = [
    "easeOutExpo,0.16,1,0.3,1"
    "easeOutCubic,0.33,1,0.68,1"
    "linear,0,0,1,1"
  ];

  animation = [
    "global,0"
    "border,1,2,easeOutCubic"
    "windows,1,3,easeOutExpo,slide"
    "windowsIn,1,3,easeOutExpo,slide"
    "windowsOut,0"
    "fadeIn,1,2,linear"
    "fadeOut,1,1.5,linear"
    "fade,1,2,linear"
    "layers,1,2,easeOutCubic,slide"
    "layersIn,1,2,easeOutCubic,slide"
    "layersOut,0"
    "workspaces,1,3,easeOutExpo,slide"
    "workspacesIn,1,3,easeOutExpo,slide"
    "workspacesOut,1,2,easeOutCubic,slidevert"
  ];
}
