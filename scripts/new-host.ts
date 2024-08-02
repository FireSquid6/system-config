#!/usr/bin/env bun
import fs from "node:fs"

const args = process.argv

for (let i = 0; i < args.length; i++) {
  if (args[i].includes('new-host.ts')) {
    args.splice(0, i + 1)
    break
  }
}

if (args.length < 2) {
  console.error('Usage: new-host <hostname> <hardware-config>')
  process.exit(1)
}

const hostname = args[0]
const hardwareConfig = args[1]

// check if the hardwareConfig exists
if (!fs.existsSync(hardwareConfig)) {
  console.error(`Hardware config file not found: ${hardwareConfig}`)
  process.exit(1)
}

// if the directory already exists, exit
if (fs.existsSync(`/etc/nixos/hosts/${hostname}`)) {
  console.error(`Host already exists: ${hostname}`)
  process.exit(1)
}

const hardwareConfigContent = fs.readFileSync(hardwareConfig, 'utf8')

fs.mkdirSync(`/etc/nixos/hosts/${hostname}`)
const localConfigContent = `{ config, lib, pkgs, ... }:

{
  networking.hostName = "${hostname}"; # Define your hostname.


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
`


fs.writeFileSync(`/etc/nixos/hosts/${hostname}/configuration.nix`, localConfigContent)
fs.writeFileSync(`/etc/nixos/hosts/${hostname}/hardware-configuration.nix`, hardwareConfigContent)


const flakeContent = fs.readFileSync('/etc/nixos/flake.nix', 'utf8')
const insertedConfiguration = `nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${hostname}/hardware-configuration.nix
        ./hosts/${hostname}/configuration.nix
        ./systemModules/std.nix
        ./systemModules/virtualization.nix
        ./systemModules/boot.nix
        ./systemModules/firesquid.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    # INSERT NEW SYSTEM HERE
`

console.log(flakeContent)
console.log("=====================================")

const newContent = flakeContent.replace("# INSERT NEW SYSTEM HERE", insertedConfiguration)
console.log(newContent)
