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
  };

  users.extraGroups.vboxusers.members = [ "firesquid" ];
}
