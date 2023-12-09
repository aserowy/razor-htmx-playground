{
  description = "cto backend poc";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      with pkgs; {
        devShell =
          pkgs.mkShell {
            buildInputs = [
              dotnet-sdk_8
              netcoredbg
              nil
              nodejs_20
              nodePackages_latest.prettier
              nixpkgs-fmt
              omnisharp-roslyn
            ];

            shellHook = ''
              export PATH=~/.dotnet/tools/:$PATH
            '';
          };
      });
}
