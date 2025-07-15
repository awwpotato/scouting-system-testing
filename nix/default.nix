{ self, ... }:
{
  imports = [ ./formatter.nix ];

  perSystem =
    { pkgs, ... }:
    {
      packages.default = pkgs.callPackage ./package.nix { inherit self; };
    };
}
