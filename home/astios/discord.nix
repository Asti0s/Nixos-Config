{
  programs.vesktop = {
    enable = true;
    vencord.settings.plugins = {
      MessageLogger = {
        enabled = true;
        ignoreSelf = true;
      };
      FakeNitro.enabled = true;
      ClearUrls.enable = true;
    };
  };
}
