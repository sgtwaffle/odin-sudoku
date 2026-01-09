rec {
  packageName = "projectName";
  modules = [
    (
      { pkgs, ... }:
      {
        pname = "odin-sudoku";
        version = "0.1";
        src = ./src;
        libs.import = [ "waffle" ];
        raylib.enable = true;
        nativeBuildInputStrs = [ "qqwing" ];
      }
    )
  ];
}
