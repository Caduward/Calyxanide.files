{ pkgs, lib, ...}:
let
"root" = "/";
"nvme" = "/mnt/nvme";
in {
  programs.i3status = {
  enable = true;
  enableDefault = false;
	};
  programs.i3status.general = {
	output_format = "i3bar";
	markup = "pango";
	colors = true;
	interval = 2;
	color_good = "#ffc445";
	color_bad = "#ba0000";
	};
  programs.i3status.modules = {
  "cpu_usage" = {
	position = 3;
	settings = {
	  format = "<span foreground='#C37B55'>⚙CPU: %usage </span>";
	    };
	  };
  "memory" = {
	position = 4;
	settings = {
	format = "<span foreground='#DBC399'>☸RAM: %used / %total</span>";
	  };
	};
  "battery 0" = {
	position = 5;
	settings = {
	path = "/sys/class/power_supply/BAT0/uevent";
	format = "<span foreground='#DBC399'>%percentage|%consumption</span>";};
	  };
  "time" = {
	position = 7;
	settings = {
	format = "<span foreground='#B9E2CF'>⧗:%H:%M</span>";
	    };
	  };
  "disk ${root}" = {
	position = 2;
	settings = {
	format = "<span foreground='#D5BEAC'>√root: %used/ %total</span>";
	    }; 
	  };
  "tztime local" = {
	position = 8;
	settings = {
	format = "<span foreground='#F3B259'>☼%d/%m</span>";
	    };
	  };
  "read_file cadu.txt" = {
	position = 1;
	settings = {
	path = "/etc/nixos/cadu.txt";
	format = "<span foreground='#746250'>%content</span>";
	    };
	  };
#  "wireless wlan0" = {
#	position = 6;
#	settings = {
#	format_up = "<span foreground='#FFDFA8'>%quality|%essid</span>";
#	format_down = "<span foreground='#FFDFA8'>OFF</span>";
#	    };
#	  };
	};
  wayland.windowManager.sway.config.bars = [
      {
	position = "bottom";
	fonts = {
	  names = ["MartianMonoNerdFontMono"];
	  size = 11.0;
	  };
	  trayOutput = "none";
	  statusCommand = "/etc/profiles/per-user/cadu/bin/i3status";
	colors = {
	  background = "#3C2C1F";
	  statusline = "#FFC75A";
	  activeWorkspace = {
		border = "#FE431D";
		background = "#413329";
		text = "FFC75A";
			    };
	urgentWorkspace = {
		border = "#DBC399";
		background = "#3C2C1F";
		text = "#C1AA8D";
	};
	focusedWorkspace = {
		border = "#DBC399";
		background = "#3C2C1F";
		text = "#C1AA8D";
	};
	inactiveWorkspace = {
		border = "#3C2C1F";
		background = "#3C2C1F";
		text = "#C1AA8D";
	};
		 };
	workspaceNumbers = false;
      }
  ];
#
}
