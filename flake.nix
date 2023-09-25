{
  description = "Learning x86_64 assembly using the FASM assembler";

  inputs = {
    flake-utils.url = github:numtide/flake-utils;
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            fasm
	          gdb
          ];

          buildInputs = with pkgs; [ ];
        };

        defaultPackage.${system} =
        pkgs.stdenv.mkDerivation rec {
          pname = "hello-fasm";
          version = "0.0.0";

          src = ./.;  # The current directory

          buildInputs = [ /* Add any other necessary build inputs here */ ];

          buildPhase = ''
            fasm hello.asm hello
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp hello $out/bin/
          '';

          meta = {
            description = "A simple Hello World program in FASM assembly for Linux";
            license = pkgs.lib.licenses.mit;  # Adjust the license as needed
          };
        };
      }
    );
}