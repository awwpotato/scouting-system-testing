{
  lib,
  stdenv,
  mkBunNodeModules,
  makeBinaryWrapper,
  bun,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "scouting-system-testing";
  version = "0";

  src = ../.;

  node_modules = mkBunNodeModules { packages = import ./bun.nix; };

  nativeBuildInputs = [
    makeBinaryWrapper
    bun
  ];

  buildPhase = ''
    runHook preBuild

    ln -sf ${finalAttrs.node_modules}/node_modules ./node_modules

    bun run build

    mkdir "$out"
    cp -r build "$out/build"
    ln -sf ${finalAttrs.node_modules}/node_modules "$out/build/node_modules"

    makeBinaryWrapper ${lib.getExe bun} "$out/bin/scouting-system" \
      --add-flags "run --prefer-offline --no-install --cwd=$out/build" \
      --append-flag "$out/build/index.js"

    runHook postBuild
  '';

  meta.mainProgram = "scouting-system";
})
