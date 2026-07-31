{ config,  pkgs, lib, ...} :{
  hardware.enableRedistributableFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
# boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
# boot.kernelParams = [];
boot.kernel.sysctl = {
	"net.ipv4.ip_foward" = 1;
#	"vm.swappiness" = 30;
}; 
#
}
