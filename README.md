# hello-world

A NixOS configuration that serves a single "Hello world" page with Caddy on port 80.

- `nixosConfigurations.hello-world` — full system
- `nixosModules.default` — just the Caddy service, for use in another configuration

```sh
nix build .#nixosConfigurations.hello-world.config.system.build.toplevel
```
