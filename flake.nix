{
  description = "Pyric's Standalone Neovim Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs = { self, nixpkgs, mnw, ... }:
    let
      system = "x86_64-linux"; 
      pkgs = nixpkgs.legacyPackages.${system};

      myNeovim = mnw.lib.wrap pkgs (import ./default.nix { inherit pkgs; inherit (pkgs) lib; });
    in
    {
      packages.${system} = {
        default = myNeovim;
        neovim = myNeovim;
      };

      overlays.default = final: prev: {
        neovim-pyric = myNeovim;
      };
    };
}
