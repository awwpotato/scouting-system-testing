{
  lib,
  self,
  stdenv,
  bun,
}:
stdenv.mkDerivation {
  name = "scouting-system";
  version = "0";

  src = self;

  installPhase = ''
    runHook preInstall

    export HOME=$(mktemp -d)
    export BUN_INSTALL_CACHE_DIR=$(mktemp -d)

    bun install \
      --force \
      --frozen-lockfile

    bun run build -- --outDir "$out/build"

    ls $out
    mkdir -p $out/bin
    cp -R ./* $out
    makeBinaryWrapper ${lib.getExe bun} $out/bin/scouting-system \
      --prefix PATH : ${lib.makeBinPath [ bun ]} \
      --add-flags "run --prefer-offline --no-install --cwd $out ./bun.js"

    runHook postInstall
  '';

  meta.mainProgram = "scouting-system";
}
