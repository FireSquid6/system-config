{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "67.207.67.2"
 "67.207.67.3"
 ];
    defaultGateway = "157.245.80.1";
    defaultGateway6 = {
      address = "";
      interface = "eth0";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="157.245.82.238"; prefixLength=20; }
{ address="10.10.0.5"; prefixLength=16; }
        ];
        ipv6.addresses = [
          { address="fe80::6893:63ff:fe0c:4cfc"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "157.245.80.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = ""; prefixLength = 128; } ];
      };
            eth1 = {
        ipv4.addresses = [
          { address="10.116.0.2"; prefixLength=20; }
        ];
        ipv6.addresses = [
          { address="fe80::9ccc:b4ff:fec4:691b"; prefixLength=64; }
        ];
        };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="6a:93:63:0c:4c:fc", NAME="eth0"
    ATTR{address}=="9e:cc:b4:c4:69:1b", NAME="eth1"
  '';
}
