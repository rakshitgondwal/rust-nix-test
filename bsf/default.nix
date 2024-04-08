
	{ pkgs}:
	let
		crateName = pkgs.rustBuilder.makePackageSet {
			packageFun = import ./Cargo.nix;
			
			rustVersion = 1.75.0; 
			
			
			
			
			
		}.workspace.hello-world {};
	in
		{
			crateName = crateName;
		}
    