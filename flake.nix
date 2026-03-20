{
  description = "Logos Counter Plugin";

  inputs = {
    logos-nix.url = "github:logos-co/logos-nix";
    nixpkgs.follows = "logos-nix/nixpkgs";
  };

  outputs = { self, logos-nix, nixpkgs }:
    let
      systems = [ "aarch64-darwin" "x86_64-darwin" "aarch64-linux" "x86_64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems ({ pkgs }:
        let
          common = import ./nix/default.nix { 
            inherit pkgs; 
          };
          src = ./.;
          
          lib = import ./nix/lib.nix {
            inherit pkgs common src;
          };
        in
        {
          default = lib;
        }
      );
    };
}
