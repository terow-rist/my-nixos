{ config, ... }:
{
  networking.networkmanager.dns = "dnsmasq";
  environment.etc."NetworkManager/dnsmasq.d/00-default.conf".text = ''
    server=1.1.1.1
    server=1.0.0.1
  '';
  environment.etc.hosts.mode = "0644";
  networking.extraHosts = ''
    10.10.5.104         media.pulsar.kazdream.kz
    10.10.5.105         ipa-master.kazdream.kz
    10.10.5.138         repo-mirror.pulsar.kazdream.kz
    10.10.5.13          nexus.pulsar.kazdream.kz
    10.10.5.13          nexus.kazdream.kz
    10.10.5.14          jenkins.pulsar.kazdream.kz
    10.10.5.14          jenkins.kazdream.kz
    10.10.5.19          redmine.kazdream.kz
    10.10.5.20          xwiki.pulsar.kazdream.kz
    10.10.5.226         dpi-storage.pulsar.kazdream.kz
    10.10.5.2           ipa-master.kazdream.kz
    10.10.5.33          passit.pulsar.kazdream.kz
    10.10.5.4           gitlab-pulsar.kazdream.kz
    10.10.5.4           pulsar.gitlab-pulsar-pages.io
    10.10.5.70          harbor.pulsar.kazdream.kz
    10.10.5.72          youtrack.pulsar.kazdream.kz
  '';
}
