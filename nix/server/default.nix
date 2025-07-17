{ self, inputs, ... }:
{
  # flake.nixosConfigurations.server = inputs.nixpkgs.lib.nixosSystem {
  #   specialArgs = { inherit self inputs; };
  #   modules = [
  #     ./config.nix
  #     ./hardware.nix
  #     ./module.nix
  #   ];
  # };
}
