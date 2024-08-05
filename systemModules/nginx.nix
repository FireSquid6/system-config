{ inputs, config, pkgs, ...}:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "jdeiss06@gmail.com";
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."vps.jdeiss.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_pass_header Authorization;
          proxy_ssl_server_name on;
        '';
      };
    };
  };

  networking.firewall.enable = false;
}
