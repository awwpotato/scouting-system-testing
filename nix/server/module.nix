{ lib, config, ... }:
{
  options.scoutingSystem = {
    enable = lib.mkEnableOption "scouting system";
  };

  config = lib.mkIf config.scoutingSystem.enable {

  };
}
