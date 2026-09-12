{ config, lib, pkgs, ... }:

let
  cfg = config.services.ldbugged-net;
in
{
  options.services.ldbugged-net = {
    enable = lib.mkEnableOption "LDBugged Network Website";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.ldbugged-net;
      description = "LDBugged Network Website package.";
    };

    host = lib.mkOption {
      type = lib.types.str;
      default = "127.0.0.1";
      description = "Address the LDBugged Network server listens on.";
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 3000;
      description = "Port the LDBugged Network server listens on.";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (final: prev:
      {
        ldbugged-net = final.callPackage ./package.nix { };
      })
    ];

    systemd.services.ldbugged-net = {
      description = "LDBugged Network Website";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.nodejs_22}/bin/node ${cfg.package}/build/index.js";

        Environment = [
          "HOST=${cfg.host}"
          "PORT=${toString cfg.port}"
        ];

        Restart = "on-failure";

        DynamicUser = true;
        PrivateTmp = true;
        ProtectSystem = "strict";
        ProtectHome = true;
        NoNewPrivileges = true;
      };
    };
  };
}