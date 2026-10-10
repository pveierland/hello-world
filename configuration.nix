{ modulesPath, ... }:
{
  imports = [ "${modulesPath}/virtualisation/linode-config.nix" ];

  networking.hostName = "hello-world";

  services.caddy = {
    enable = true;
    virtualHosts.":80".extraConfig = ''
      root * ${./site}
      file_server
    '';
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

  system.stateVersion = "26.05";
}
