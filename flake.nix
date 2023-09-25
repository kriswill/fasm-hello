{
  description = "Learning x86_64 assembly using Flat Assembler";

  inputs = {
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        program-name = "fasm-hello";
      in
      {
        # nix develop, or automatically when using direnv
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            fasm
          ];
          shellHook = ''
            export PATH=$(realpath ./result/bin):$PATH
          '';
        };

        # nix build
        # creates binary in ./result/bin/fasm-hello
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "${program-name}";
          version = "0.1.0";

          src = ./.;

          buildInputs = with pkgs; [ fasm ];

          buildPhase = ''
            pwd
            ls -la
            ${pkgs.fasm}/bin/fasm ${program-name}.asm ${program-name}
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp ${program-name} $out/bin/
            chmod +x $out/bin/${program-name}
          '';

          meta = {
            description = "A simple Hello World program in Flat Assember (fasm) for Linux";
            license = pkgs.lib.licenses.mit;
          };
        };
      }
    );
}