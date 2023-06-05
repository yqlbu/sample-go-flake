{
  stdenv,
  raylib,
  # fetchgit,
  ...
}: stdenv.mkDerivation {

  pname = "hello";
  version = "v0.0.1";
  src = ./src;

  # src = fetchgit {
  #   url = "https://github.com/daeuniverse/dae";
  #   rev = "";
  #   sha256 = "";
  # };

  buildInputs = [raylib];
  buildPhase = ''
    gcc -c main.c
    gcc main.o -o main
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv main $out/bin/hello
  '';
}
