# Common build configuration for logos-counter
{ pkgs }:

{
  pname = "logos-counter";
  version = "1.0.0";
  
  # Common native build inputs
  nativeBuildInputs = [ 
    pkgs.cmake 
    pkgs.ninja 
    pkgs.pkg-config
    pkgs.qt6.wrapQtAppsHook
  ];
  
  # Common runtime dependencies
  buildInputs = [ 
    pkgs.qt6.qtbase 
    pkgs.qt6.qtdeclarative
    pkgs.zstd
    pkgs.krb5
    pkgs.abseil-cpp
    pkgs.zlib
    pkgs.icu
  ];
  
  # Common CMake flags
  cmakeFlags = [ 
    "-GNinja"
    "-DCMAKE_BUILD_TYPE=Release"
  ];
  
  # Metadata
  meta = with pkgs.lib; {
    description = "Logos Counter Plugin";
    platforms = platforms.unix;
  };
}
