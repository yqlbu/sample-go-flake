{
  description = "A very basic hello-world go package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:

  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system} = {
      pkg = pkgs.callPackage ./default.nix {};
      default = self.packages.${system}.pkg;
    };
  };
}
