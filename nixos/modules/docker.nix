{
  virtualisation.docker = {
    enable = true;

    daemon.settings = {
      insecure-registries = [
        "harbor.pulsar.kazdream.kz"
      ];
    };
  };
}
