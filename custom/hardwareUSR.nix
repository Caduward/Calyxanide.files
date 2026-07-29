{ config,  pkgs, lib, ...} :{
  hardware.enableRedistributableFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
 boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
 boot.kernelParams = [
"mitigations=off"
"xe.force_probe=8086:e20b"
"i915.force_probe=!8086:e20b"
"i915.enable_guc=3"
];
boot.kernel.sysctl = {
	"net.ipv4.ip_foward" = 1;
	"vm.swappiness" = 30;
}; 
#pkgs.linuxPackages_xanmod_latest - BASE

#
}
