{
  inputs = {
    cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
    flake-utils.follows = "cargo2nix/flake-utils";
    nixpkgs.follows = "cargo2nix/nixpkgs";
  };

  outputs = { self, nixpkgs, cargo2nix,}:
  let
    supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
    forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [cargo2nix.overlays.default];
      };

      rustPkgs = pkgs.rustBuilder.makePackageSet {
        rustVersion = "1.75.0";
        packageFun = import ./Cargo.nix;
      };

    });
  in {
    packages = forEachSupportedSystem ({ pkgs, }: {
      default = pkgs.callPackage ./default.nix {
        hello-world = (pkgs.rustPkgs.workspace.hello-world {});
        default = packages.hello-world;
      };
    });
  };
}
