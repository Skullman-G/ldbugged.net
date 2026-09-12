{
  description = "Skullys personal Homepage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forEachSystem = f:
        nixpkgs.lib.genAttrs systems (system:
          f (import nixpkgs {
            inherit system;
          })
        );
    in
    {
      packages = forEachSystem (pkgs: {
        default = pkgs.callPackage ./package.nix {};
      });

      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs
            pnpm_11
          ];
        };
      });

      nixosModules.default = import ./module.nix;
    };
}