{
  lib,
  config,
  self,
  ...
}:
let
  cfg = config.scouting-system;
in
{
  options.scouting-system = {
    enable = lib.mkEnableOption "scouting system";

    package = lib.mkOption {
      type = lib.types.package;
      default = self.pacakges.scouting-system;
    };

    port = lib.mkOption {
      default = 3000;
      type = lib.types.port;
    };

    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    user = lib.mkOption {
      type = lib.types.str;
      default = "scouting-system";
    };

    group = lib.mkOption {
      type = lib.types.str;
      default = "scouting-system";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.scouting-system = {
      description = "Scouting System";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        User = cfg.user;
        Restart = "always";
        ExecStart = "${lib.getExe cfg.package} --port ${cfg.port}";
      };
    };

    users = {
      users.scouting-system = lib.mkIf (cfg.user == "scouting-system") {
        group = cfg.group;
      };
      groups.scouting-system = lib.mkIf (cfg.groups == "scouting-system") { };
    };

    networking.firewall = lib.mkIf cfg.openFirewall { allowedTCPPorts = [ cfg.port ]; };
  };
}
