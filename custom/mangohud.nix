{ pkgs, lib, ...} :{
  programs.mangohud = lib.mkForce {
	enable = true;
	settings = {
  frametime = true;
  fps = true;
  fps_limit="75,0";
  fps_limit_method = "early";
  show_fps_limit = true;
  fps_metrics = "avg,0.01";
  gpu_temp = true;
  gpu_load_change = true;
  gpu_load_value = "60,90";
  gpu_load_color = "39F900, FDFD09, B22222";
  cpu_temp = true;
  cpu_load_change = true;
  cpu_load_value = "50,80";
  cpu_load_color = "39F900,FDFD09,B22222";
  cpu_mhz = true;
  toggle_hud = "F2";
  toggle_fps_limit = "F12";
  exec = "/etc/profiles/per-user/cadu/bin/mangohud";
  ram = true;
  vram = true;
  gpu_name = true;
  gamemode = true;
  refresh_rate = true;
  vkbasalt = true; 
   };
 };
#
}
