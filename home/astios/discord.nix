{
  programs.vesktop = {
    enable = true;

    vencord.settings.plugins = {
      MessageLogger = {
        enable = true;
        ignoreSelf = true;
      };
      FakeNitro.enable = true;
      ClearUrls.enable = true;
    };
  };
}
