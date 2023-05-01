{ pkgs, misc, ... }: {
   home.shellAliases = {
    apply-dvpc = "nix run --impure home-manager/master -- -b bak switch --flake .#david";
    
    # bat --plain for unformatted cat
    catp = "bat -P";
    
    # replace cat with bat
    cat = "bat";

    # utilites
    cl = "clear";
    cls = "clear && exa -lh";
    cla = "clear && exa -lah";

    # git
    lg = "lazygit";


    };
}
