{
  stdenv,
  mkBunNodeModules,
  bun,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "scouting-system-testing";
  version = "0";

  src = ../.;

  node_modules = mkBunNodeModules { packages = import ./bun.nix; };

  nativeBuildInputs = [ bun ];

  buildPhase = ''
    runHook preBuild

    ln -sf ${finalAttrs.node_modules}/node_modules ./node_modules
    ls -A

    bun run build 
    cp -r dest $out/dest

    runHook postBuild
  '';
})
