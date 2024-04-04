
	{ pkgs ? rustPkgs}:
    rustPkgs = pkgs: pkgs.rustBuilder.makePackageSet {
		packageFun = import ./Cargo.nix;
		
		
		
		
		
		
	};
	
	crateName = (rustPkgs.workspace.hello-world {});
    