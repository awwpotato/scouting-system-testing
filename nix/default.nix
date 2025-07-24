{ inputs, ... }:
{
  imports = [
    ./server
    ./formatter.nix
    ./dev-shell.nix
  ];

  perSystem =
    {
      pkgs,
      system,
      config,
      ...
    }:
    {
      # Build all packages with 'nix flake check' instead of only verifying they
      # are derivations.
      checks = config.packages;

      packages = {
        default = config.packages.scouting-system;
        scouting-system = pkgs.callPackage ./package.nix {
          inherit (inputs.bun2nix.lib.${system}) mkBunNodeModules;
        };
      };
    };
}
