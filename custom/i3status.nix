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
  "time" = {
	position = 8;
	settings = {
	format = "<span foreground='#B9E2CF'>⧗:%H:%M</span>";
	    };
	  };
  "tztime local" = {
	position = 7;
	settings = {
	format = "<span foreground='#F3B259'>☼%d/%m</span>";
	    };
	  };
  "read_file swap.txt" = {
	position = 6;
	settings = {
	path = "/etc/nixos/info/swap.txt";
	format = "<span foreground='#ff3c1c'>Swap:%content/4.5G</span>";
	    };
	  };
  "memory" = {
	position = 5;
	settings = {
	format = "<span foreground='#DBC399'>☸RAM:%used/%total</span>";};
	  };
  "cpu_usage" = {
	position = 4;
	settings = {
	  format = "<span foreground='#C37B55'>⚙CPU:%usage</span>";
	    };
	  };
  "disk ${root}" = {
	position = 3;
	settings = {
	format = "<span foreground='#D5BEAC'>√root:%used/%total</span>";
	    }; 
	  };
  "disk ${nvme}" = {
	position = 2;
	settings = {
	format = "<span foreground='#EBFEC2'>▥NVME:%used/%total</span>";
	    }; 
	  };
  "read_file sysname.txt" = {
	position = 1;
	settings = {
	path = "/etc/nixos/info/sysname.txt";
	format = "<span foreground='#746250'>%content</span>";
	    };
	  };
	};
  wayland.windowManager.sway.config.bars = [
      {
	position = "bottom";
	fonts = {
	  names = ["MartianMonoNerdFontMono"];
	  size = 12.0;
	  };
	  trayOutput = "none";
	  statusCommand = "/etc/profiles/per-user/cadu/bin/i3status";
	colors = {
	  background = "#261c14";
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
