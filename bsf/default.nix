
	{ pkgs ? rustPkgs}:
    rustPkgs = pkgs: pkgs.rustBuilder.makePackageSet {
		packageFun = import ./Cargo.nix;
		
		rustVersion = 1.75.0; 
		
		
		
		
		
	};
	
	crateName = (rustPkgs.workspace.hello-world {});
    