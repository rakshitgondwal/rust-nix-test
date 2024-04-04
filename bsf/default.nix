
	{ pkgs ? rustPkgs}:
    rustPkgs = pkgs: pkgs.rustBuilder.makePackageSet {
		packageFun = import ./Cargo.nix;
		
		
		
		
		
		
	};
	
	crateName = (rustPkgs.workspace.name = &#34;hello-world&#34;hello-world {});
    