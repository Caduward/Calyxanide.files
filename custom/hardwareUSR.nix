{ config,  pkgs, lib, ...} :{
  hardware.enableRedistributableFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
	intel-media-driver
	libva-vdpau-driver
    ];
  };
# boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
boot.kernelParams = [
	"i915.enable_rc6=7"
	"intel_pstate=active"
];
boot.kernel.sysctl = {
	"net.ipv4.ip_foward" = 1;
#	"vm.swappiness" = 30;
};
powerManagement.cpuFreqGovernor = "performance"; 
# ondemand powersave performance
#
}
