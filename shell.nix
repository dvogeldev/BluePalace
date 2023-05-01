{ pkgs, config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      set - o vi
    '';
    profileExtra = "[ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source ~/.nix-profile/etc/profile.d/nix.sh";
  };
  programs.zoxide = {
    enableBashIntegration = true;
  };
  programs.exa = {
    enableAliases = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
