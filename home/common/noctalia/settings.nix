{
  appLauncher = {
    customLaunchPrefix = "";
    customLaunchPrefixEnabled = false;
    enableClipPreview = true;
    enableClipboardHistory = false;
    pinnedExecs = [ ];
    position = "center";
    showCategories = true;
    sortByMostUsed = true;
    terminalCommand = "foot -e";
    useApp2Unit = false;
    viewMode = "list";
  };

  audio = {
    cavaFrameRate = 30;
    externalMixer = "foot -e pulsemixer || pwvucontrol || pavucontrol";
    mprisBlacklist = [ ];
    preferredPlayer = "";
    visualizerQuality = "high";
    visualizerType = "linear";
    volumeOverdrive = false;
    volumeStep = 5;
  };

  bar = {
    backgroundOpacity = 1;
    capsuleOpacity = 1;
    density = "comfortable";
    exclusive = true;
    floating = true;
    marginHorizontal = 0.35;
    marginVertical = 0.35;
    monitors = [ "DP-2" "DP-3" ];
    outerCorners = true;
    position = "top";
    showCapsule = true;

    widgets = {
      center = [
        {
          id = "Clock";
          customFont = "";
          formatHorizontal = "HH:mm - ddd, MMM dd";
          formatVertical = "HH mm - dd MM";
          useCustomFont = false;
          usePrimaryColor = false;
        }
      ];

      left = [
        {
          id = "CustomButton";
          hideMode = "alwaysExpanded";
          icon = "rocket";
          leftClickExec = "qs -c noctalia-shell ipc call launcher toggle";
          leftClickUpdateText = false;
          maxTextLength = {
            horizontal = 10;
            vertical = 10;
          };
          middleClickExec = "";
          middleClickUpdateText = false;
          parseJson = false;
          rightClickExec = "";
          rightClickUpdateText = false;
          showIcon = true;
          textCollapse = "";
          textCommand = "";
          textIntervalMs = 3000;
          textStream = false;
          wheelDownExec = "";
          wheelDownUpdateText = false;
          wheelExec = "";
          wheelMode = "unified";
          wheelUpExec = "";
          wheelUpUpdateText = false;
          wheelUpdateText = false;
        }

        {
          id = "Workspace";
          characterCount = 1;
          colorizeIcons = true;
          followFocusedScreen = false;
          hideUnoccupied = false;
          labelMode = "index";
          showApplications = false;
          showLabelsOnlyWhenOccupied = true;
        }

        {
          id = "MediaMini";
          hideMode = "hidden";
          hideWhenIdle = false;
          maxWidth = 145;
          scrollingMode = "hover";
          showAlbumArt = false;
          showArtistFirst = true;
          showProgressRing = true;
          showVisualizer = false;
          useFixedWidth = true;
          visualizerType = "wave";
        }
      ];

      right = [
        { id = "ScreenRecorder"; }

        {
          id = "Volume";
          displayMode = "alwaysShow";
        }

        {
          id = "Microphone";
          displayMode = "alwaysShow";
        }

        {
          id = "SystemMonitor";
          diskPath = "/";
          showCpuTemp = false;
          showCpuUsage = true;
          showDiskUsage = false;
          showGpuTemp = false;
          showMemoryAsPercent = false;
          showMemoryUsage = true;
          showNetworkStats = false;
          usePrimaryColor = false;
        }

        {
          id = "Tray";
          blacklist = [ ];
          colorizeIcons = true;
          drawerEnabled = true;
          hidePassive = false;
          pinned = [ ];
        }

        {
          id = "SessionMenu";
          colorName = "error";
        }
      ];
    };
  };

  brightness = {
    brightnessStep = 5;
    enableDdcSupport = true;
    enforceMinimum = false;
  };

  calendar.cards = [
    { id = "calendar-header-card"; enabled = true; }
    { id = "calendar-month-card"; enabled = true; }
    { id = "timer-card"; enabled = true; }
    { id = "weather-card"; enabled = true; }
  ];

  colorSchemes = {
    darkMode = true;
    generateTemplatesForPredefined = true;
    manualSunrise = "06:30";
    manualSunset = "18:30";
    matugenSchemeType = "scheme-fruit-salad";
    predefinedScheme = "Catppuccin";
    schedulingMode = "off";
    useWallpaperColors = false;
  };

  controlCenter = {
    position = "close_to_bar_button";

    cards = [
      { id = "profile-card"; enabled = true; }
      { id = "shortcuts-card"; enabled = true; }
      { id = "audio-card"; enabled = true; }
      { id = "weather-card"; enabled = true; }
      { id = "media-sysmon-card"; enabled = true; }
    ];

    shortcuts = {
      left = [{ id = "ScreenRecorder"; }];
      right = [
        { id = "PowerProfile"; }
        { id = "KeepAwake"; }
        { id = "NightLight"; }
      ];
    };
  };

  dock = {
    backgroundOpacity = 1;
    colorizeIcons = false;
    deadOpacity = 0.6;
    displayMode = "auto_hide";
    enabled = false;
    floatingRatio = 1;
    inactiveIndicators = false;
    monitors = [ ];
    onlySameOutput = true;
    pinnedApps = [ ];
    pinnedStatic = false;
    size = 1;
  };

  general = {
    allowPanelsOnScreenWithoutBar = true;
    animationDisabled = false;
    animationSpeed = 1.5;
    avatarImage = "/home/ratoncio/.face";
    boxRadiusRatio = 1;
    compactLockScreen = false;
    dimmerOpacity = 0.6;
    enableShadows = true;
    forceBlackScreenCorners = false;
    iRadiusRatio = 1;
    language = "";
    lockOnSuspend = true;
    radiusRatio = 1;
    scaleRatio = 1;
    screenRadiusRatio = 1;
    shadowDirection = "center";
    shadowOffsetX = 0;
    shadowOffsetY = 0;
    showHibernateOnLockScreen = false;
    showScreenCorners = false;
    showSessionButtonsOnLockScreen = true;
  };

  hooks = {
    enabled = false;
    darkModeChange = "";
    wallpaperChange = "";
  };

  location = {
    name = "Bahia";
    analogClockInCalendar = false;
    firstDayOfWeek = -1;
    showCalendarEvents = true;
    showCalendarWeather = true;
    showWeekNumberInCalendar = false;
    use12hourFormat = false;
    useFahrenheit = false;
    weatherEnabled = true;
    weatherShowEffects = false;
  };

  network.wifiEnabled = false;

  nightLight = {
    autoSchedule = false;
    dayTemp = "6500";
    enabled = false;
    forced = false;
    manualSunrise = "06:30";
    manualSunset = "18:30";
    nightTemp = "4503";
  };

  notifications = {
    backgroundOpacity = 1;
    criticalUrgencyDuration = 15;
    enableKeyboardLayoutToast = false;
    enabled = false;
    location = "top_right";
    lowUrgencyDuration = 3;
    monitors = [ ];
    normalUrgencyDuration = 8;
    overlayLayer = true;
    respectExpireTimeout = false;

    sounds = {
      enabled = false;
      excludedApps = "discord,firefox,chrome,chromium,edge";
      separateSounds = false;
      criticalSoundFile = "";
      lowSoundFile = "";
      normalSoundFile = "";
      volume = 0.5;
    };
  };

  osd = {
    autoHideMs = 2000;
    backgroundOpacity = 1;
    enabled = true;
    enabledTypes = [ ];
    location = "top_right";
    monitors = [ ];
    overlayLayer = true;
  };

  screenRecorder = {
    audioCodec = "opus";
    audioSource = "default_output";
    colorRange = "limited";
    directory = "/home/ratoncio/Videos";
    frameRate = 60;
    quality = "very_high";
    showCursor = true;
    videoCodec = "h264";
    videoSource = "portal";
  };

  sessionMenu = {
    countdownDuration = 5000;
    enableCountdown = true;
    position = "center";
    showHeader = true;

    powerOptions = [
      { action = "lock"; enabled = true; countdownEnabled = true; command = ""; }
      { action = "suspend"; enabled = false; countdownEnabled = true; command = ""; }
      { action = "hibernate"; enabled = false; countdownEnabled = true; command = ""; }
      { action = "reboot"; enabled = true; countdownEnabled = true; command = ""; }
      { action = "logout"; enabled = true; countdownEnabled = true; command = ""; }
      { action = "shutdown"; enabled = true; countdownEnabled = true; command = ""; }
    ];
  };

  systemMonitor = {
    cpuCriticalThreshold = 90;
    cpuPollingInterval = 3000;
    cpuWarningThreshold = 80;
    diskCriticalThreshold = 90;
    diskPollingInterval = 3000;
    diskWarningThreshold = 80;
    gpuCriticalThreshold = 90;
    gpuPollingInterval = 3000;
    gpuWarningThreshold = 80;
    memCriticalThreshold = 90;
    memPollingInterval = 3000;
    memWarningThreshold = 80;
    networkPollingInterval = 3000;
    tempCriticalThreshold = 90;
    tempPollingInterval = 2250;
    tempWarningThreshold = 80;
    useCustomColors = false;
    criticalColor = "";
    warningColor = "";
  };

  templates = {
    alacritty = false;
    cava = false;
    code = false;
    discord = false;
    emacs = false;
    enableUserTemplates = false;
    foot = false;
    fuzzel = false;
    ghostty = false;
    gtk = false;
    kcolorscheme = false;
    kitty = false;
    niri = false;
    pywalfox = false;
    qt = false;
    spicetify = false;
    telegram = false;
    vicinae = false;
    walker = false;
    wezterm = false;
    yazi = false;
  };

  ui = {
    fontDefault = "Ubuntu Nerd Font";
    fontDefaultScale = 1;
    fontFixed = "monospace";
    fontFixedScale = 1;
    panelBackgroundOpacity = 1;
    panelsAttachedToBar = true;
    settingsPanelMode = "attached";
    tooltipsEnabled = true;
  };

  wallpaper = {
    directory = "/home/ratoncio/Pictures/Wallpapers";
    enableMultiMonitorDirectories = false;
    enabled = false;
    fillColor = "#000000";
    fillMode = "crop";
    hideWallpaperFilenames = false;
    monitorDirectories = [ ];
    overviewEnabled = false;
    panelPosition = "follow_bar";
    randomEnabled = false;
    randomIntervalSec = 300;
    recursiveSearch = false;
    setWallpaperOnAllMonitors = true;
    transitionDuration = 1500;
    transitionEdgeSmoothness = 0.05;
    transitionType = "random";
    useWallhaven = false;
    wallhavenCategories = "111";
    wallhavenOrder = "desc";
    wallhavenPurity = "100";
    wallhavenQuery = "";
    wallhavenResolutionHeight = "";
    wallhavenResolutionMode = "atleast";
    wallhavenResolutionWidth = "";
    wallhavenSorting = "relevance";
  };
}

