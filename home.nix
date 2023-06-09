{ config, pkgs, home-manager, stylix, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePrediacate = (_: true);
    };
  };

  home = {
    stateVersion = "22.11"; # Please read the comment before changing.
    packages = with pkgs; [
      (pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; })
      cantarell-fonts
      bibata-cursors
      qogir-icon-theme
      papirus-icon-theme
      kora-icon-theme
      easyeffects
      emacs
      fd
      emacsPackages.vterm
      emacsPackages.sqlite3
      neovim
      sqlite
      ripgrep
      skim
      bottom
      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/david/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
    sessionVariables = {
      EDITOR = "nvim";
    };
};

  services.emacs.enable = true;

  stylix.image = "/home/david/Pictures/wallpapersden.com_mountain-minimalist-night_3840x2160.jpg";
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
}
