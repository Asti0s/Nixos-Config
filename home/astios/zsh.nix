{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.append = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "npm"
        "web-search"
        "colored-man-pages"
        "extract"
      ];
    };

    autosuggestion = {
      enable = true;
      strategy = [
        "history"
      ];
    };
  };
}
