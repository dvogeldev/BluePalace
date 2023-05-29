{ pkgs, ... }:

let
  keysBackup = pkgs.writeShellScriptBin "keysBackup" ''
    dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > $HOME/.config/home-manager/data/custom-shortcuts.conf # Export
  '';
#  keysImport = pkgs.writeShellScriptBin "keysImport" ''
#    dconf load / < $HOME/.config/home-manager/data/custom-shortcuts.conf # Import
#  '';


in {
  environment.systemPackages = [ keysBackup ];
}

