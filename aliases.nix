{ pkgs, misc, ... }: {
   home.shellAliases = {
    apply-dvpc = "nix run --impure home-manager/master -- -b bak switch --flake .#bjk@beast";
    
    # bat --plain for unformatted cat
    catp = "bat -P";
    
    # replace cat with bat
    cat = "bat";
    };
}
