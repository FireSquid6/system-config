{ inputs, config, pkgs, ...}:

{
  users.users.firesquid = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "firesquid";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
    packages = with pkgs; [
      font-manager
    ];

    openssh.authorizedKeys.keys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9G5ezGqMsC9TDs460Tga+Gfx2NBoMWMI3kjM1ER6BH firesquid@kotoko''
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIZkWe/FtUHUFNGMB91BWcDZA5GxiqlvYcYHK8cogtm5 firesquid@horikita''
    ];
  };


  users.extraGroups.vboxusers.members = [ "firesquid" ];
}
