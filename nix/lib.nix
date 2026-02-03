# Builds the counter library
{ pkgs, common, src }:

let
  cmakeFlags = common.cmakeFlags;
in
pkgs.stdenv.mkDerivation {
  pname = common.pname;
  version = common.version;
  
  inherit src cmakeFlags;
  nativeBuildInputs = common.nativeBuildInputs;
  buildInputs = common.buildInputs;
  inherit (common) meta;
    
  configurePhase = ''
    runHook preConfigure
    
    echo "Configuring logos-counter..."
    cmake -S . -B build \
      ${pkgs.lib.concatStringsSep " " cmakeFlags}
    
    runHook postConfigure
  '';
  
  buildPhase = ''
    runHook preBuild
    
    cmake --build build
    echo "Logos counter plugin built successfully!"
    
    runHook postBuild
  '';
  
  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/lib
    
    if [ -f "build/counter.dylib" ]; then
      cp build/counter.dylib $out/lib/
    elif [ -f "build/counter.so" ]; then
      cp build/counter.so $out/lib/
    else
      echo "Error: No counter library file found"
      exit 1
    fi
    
    runHook postInstall
  '';
}
