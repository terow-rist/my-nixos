let
  yoga = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG/6GNBs/+NewQ6AK4igl7dZp8+HgCUzl++eIBV/3TGk"; 
  hosts = [ yoga ]; #for future
in
{
  "wg-yoga.age".publicKeys = hosts;
  "wg-jubber.age".publicKeys = hosts;
  "wg-jubber-presh.age".publicKeys = hosts;
}
