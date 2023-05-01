{ pkgs, misc, ... }: {

    programs.exa.enable = true; 
    programs.bat.enable = true; 
    programs.atuin.enable = true; 
    programs.zoxide.enable = true; 
    programs.direnv.enable = true; 
    programs.starship.enable = true;
    programs.dircolors.enable = true;
    programs.lazygit.enable = true;
    programs.git = {
      enable = true;
      userEmail = "btwiusemacs@fastmail.us";
      userName = "David Vogel";
      signing = {
        key = "A3A2BB4052A8C68E5D16E5B546F5872946BEE0";
        signByDefault = true;
      };
    };
}
