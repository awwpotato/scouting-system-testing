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
    ln -sf ${finalAttrs.node_modules}/node_modules "$out/node_modules"

    makeBinaryWrapper ${lib.getExe bun} "$out/bin/scouting-system" \
      --prefix PATH : ${lib.makeBinPath [ bun ]} \
      --add-flags "run --prefer-offline --no-install --cwd $out $out/build/index.js"

    runHook postBuild
  '';

  meta.mainProgram = "scouting-system";
})
