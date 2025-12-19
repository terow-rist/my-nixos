{ config, ... }:
{
  networking.networkmanager.dns = "dnsmasq";
  environment.etc."NetworkManager/dnsmasq.d/00-default.conf".text = ''
    server=1.1.1.1
    server=1.0.0.1
  '';
  environment.etc."NetworkManager/dnsmasq.d/7g-vpn.conf".text = ''
    server=/7g.team/10.10.5.2
    server=/kazdream.kz/10.10.5.2
    server=/gitlab-pulsar-pages.io/10.10.5.2
  '';
}