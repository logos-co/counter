{
  description = "Logos Counter Plugin";

  inputs = {
    # Rev-pinned: the generated-view-plugin support this module now depends on
    # lives on logos-module-builder's feat/sdk-codegen-b4-qt-host-repoint branch,
    # not on its master, so a plain `github:logos-co/logos-module-builder` url
    # would relock to master and lose it.
    logos-module-builder.url = "github:logos-co/logos-module-builder/c60d4a9cf32cb5281909e53159c9c4cfeb993847";
  };

  outputs = inputs@{ logos-module-builder, ... }:
    logos-module-builder.lib.mkLogosQmlModule {
      src = ./.;
      configFile = ./metadata.json;
      flakeInputs = inputs;
    };
}
