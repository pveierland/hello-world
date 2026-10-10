# hello-world

A NixOS configuration for Linode that serves a single "Hello world" page with
Caddy on port 80. Machine setup (disk, GRUB, LISH serial console, networking,
SSH) comes from nixpkgs' `virtualisation/linode-config.nix`.

## First deploy

Build the gzipped raw disk image Linode expects:

```sh
nix build .#nixosConfigurations.hello-world.config.system.build.images.linode
# or: nixos-rebuild build-image --image-variant linode --flake .#hello-world
```

Upload `result/*.img.gz` as a custom image (Cloud Manager → Images → Upload, or
`linode-cli image-upload --label hello-world --region <region> result/*.img.gz`),
then create a Linode from it. In the Linode's configuration profile, set the
kernel to GRUB 2 so it boots the NixOS kernel from the image.

## Updates

```sh
nixos-rebuild switch --flake .#hello-world --target-host root@<ip>
```

## Local test

```sh
nix build .#nixosConfigurations.hello-world.config.system.build.vm
QEMU_NET_OPTS=hostfwd=tcp::8080-:80 ./result/bin/run-hello-world-vm
# then open http://localhost:8080
```
