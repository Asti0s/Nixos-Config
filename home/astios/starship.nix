{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    enableBashIntegration = false;
    enableFishIntegration = false;
    enableIonIntegration = false;
    enableNushellIntegration = false;
  };

  xdg.configFile."starship.toml".source = ./starship.toml;
}
