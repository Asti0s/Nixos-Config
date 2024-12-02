{ pkgs, username, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "fr";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };

    libinput = {
      enable = true;
    };
  };
}
