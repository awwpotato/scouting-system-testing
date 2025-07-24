{ self, inputs, ... }:
{
  flake = {
    nixosModules.default = ./module.nix;
    # nixosConfigurations.server = inputs.nixpkgs.lib.nixosSystem {
    #   specialArgs = { inherit self inputs; };
    #   modules = [
    #     ./config.nix
    #     ./hardware.nix
    #     ./module.nix
    #   ];
    # };
  };
}
