# Flat Assembler Hello World example

This example shows how to write a simple "Hello, World!" example using
Flat Assembler.  I made this simple example so that I could learn this
compiler, and create a Nix derivation to compile and run it.

## Setup

I use a Nix Flake to manage the build toolchain, and provide a development
shell:

1. Install the Nix Package Manager [the standard way](https://nixos.org/download), or using the
  [Determinate Installer](https://github.com/DeterminateSystems/nix-installer#the-determinate-nix-installer).
2. Configure Nix to use [Flakes](https://nixos.wiki/wiki/Flakes).  _(default config if using the Determinate Installer)_
3. Install [direnv](https://direnv.net/).
4. run: `direnv allow` in the project directory.
5. Build the project:

    nix build

6. Run the built program:

    ./result/bin/fasm-hello

