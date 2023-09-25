# Flat Assembler "Hello World" example

A Simple "Hello, World!" example using [Flat Assembler](https://flatassembler.net/).

## Setup

I use a Nix Flake to manage the build toolchain, and provide a development
shell:

1. Install the Nix Package Manager [the standard way](https://nixos.org/download), or using the
  [Determinate Installer](https://github.com/DeterminateSystems/nix-installer#the-determinate-nix-installer).
2. Configure Nix to use [Flakes](https://nixos.wiki/wiki/Flakes).  _(default config if using the Determinate Installer)_
3. Install [direnv](https://direnv.net/).
4. Create a `.envrc` file to enable the development shell:

  ```sh
  echo "use flakes" > .envrc
  ```

5. enable direnv:

  ```sh
  direnv allow
  ```

6. Build the project:

  ```sh
  nix build
  ```

7. Run the built program, should be on path at `./result/bin/fasm-hello`:

  ```sh
  fasm-hello
  ```

## More Examples

You can find more flat assembler examples at their [website here](https://flatassembler.net/examples.php).