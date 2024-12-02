{ ... }:

{
  services = {
    dbus.enable = true;
  };

  services.logind.extraConfig = ''
    # dont shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
