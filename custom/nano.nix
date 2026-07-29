{ pkgs, lib, ...} :{

programs.nano = {
	enable = true;
	nanorc = ''
	set linenumbers
	set afterends
	set minibar
	set multibuffer
	set nohelp
	set smarthome '';

  };
#
}
