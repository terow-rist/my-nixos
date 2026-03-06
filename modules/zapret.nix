{ ... }:
{
  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=multisplit"
      "--dpi-desync-split-pos=2"
    ];
  };
}
