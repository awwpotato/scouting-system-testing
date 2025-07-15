{ self, ... }:
{
  imports = [ ./formatter.nix ];

  perSystem =
    { pkgs, config, ... }:
    {
      # Build all packages with 'nix flake check' instead of only verifying they
      # are derivations.
      checks = config.packages;

      packages.default = pkgs.callPackage ./package.nix { inherit self; };
    };
}
