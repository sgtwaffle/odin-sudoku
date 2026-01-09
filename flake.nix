{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-odin.url = "https://git.sgtwaffle.com/sgtwaffle/nix-odin/archive/main.tar.gz";
    nixvim-waffle.url = "https://git.sgtwaffle.com/wafip/nixvim/archive/main.tar.gz";
    #Copy the above and replace "waffle" with other user to add other editor configs.
  };

  outputs =
    {
      self,
      nix-odin,
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      nixvim-user = "waffle";
      packageConfig = import ./config.nix;
      localOverlays = [
      ];
      propagatedOverlays = [
        #use this to import nix odin libs
      ];
    in
    # For an odin library use mkOdinLibFlake.out/overlay instead
    (nix-odin.lib.mkOdinFlake.out {
      inherit
        self
        nixpkgs
        nix-odin
        flake-utils
        packageConfig
        nixvim-user
        localOverlays
        ;
    })
    // nix-odin.lib.mkOdinFlake.overlay { inherit nix-odin packageConfig propagatedOverlays; };
}
