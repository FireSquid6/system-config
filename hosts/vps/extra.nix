{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    
  ];

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKX7MwrgTvm39feeVagcHO2Sza3sIvtc3mPll89Rf/04 firesquid@kotoko'' ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9G5ezGqMsC9TDs460Tga+Gfx2NBoMWMI3kjM1ER6BH firesquid@kotoko'' ''# Added and Managed by DigitalOcean Droplet Agent (code name: DOTTY)'' ''ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJl4bvR7gepAcz6rDQw7MdF9ogWvjmMoRMXkuh5upNuW/+lDbBd2+eVL61E1sx1/1xeanPtd5BOGSgRvon7RypI= {os_user:root,actor_email:jdeiss06@gmail.com,expire_at:2024-08-04T01:25:15Z}-dotty_ssh'' ];

  users.users.firesquid.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKX7MwrgTvm39feeVagcHO2Sza3sIvtc3mPll89Rf/04 firesquid@kotoko'' ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9G5ezGqMsC9TDs460Tga+Gfx2NBoMWMI3kjM1ER6BH firesquid@kotoko'' ''# Added and Managed by DigitalOcean Droplet Agent (code name: DOTTY)'' ''ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJl4bvR7gepAcz6rDQw7MdF9ogWvjmMoRMXkuh5upNuW/+lDbBd2+eVL61E1sx1/1xeanPtd5BOGSgRvon7RypI= {os_user:root,actor_email:jdeiss06@gmail.com,expire_at:2024-08-04T01:25:15Z}-dotty_ssh'' ];
  system.stateVersion = "23.11";
}
