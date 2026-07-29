{ pkgs, lib, ...} :{

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extest.enable = true;
    -hardware.enable = true;
  };
  programs.gamemode = {
    enable = true;
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
	env = {
#	INTEL_DEBUG = "noccs"
	ANV_QUEUE_THREAD_DISABLE = 1;
#	WINE_WAYLAND = 1;
    };
	args = [];
  };

#
}
