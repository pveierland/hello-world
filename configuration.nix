{ lib, ... }:
{
  networking.hostName = lib.mkDefault "hello-world";

  services.caddy = {
    enable = true;
    virtualHosts.":80".extraConfig = ''
      root * ${./site}
      file_server
    '';
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

  # Placeholders so the configuration evaluates standalone; the deployment
  # target is expected to provide its own hardware and boot configuration.
  boot.loader.grub.enable = lib.mkDefault false;
  fileSystems."/" = lib.mkDefault {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  system.stateVersion = "26.05";
}
