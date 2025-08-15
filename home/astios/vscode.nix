{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "editor.formatOnSave" = true;
        "files.trimTrailingWhitespace" = true;
        "editor.renderWhitespace" = "all";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "workbench.iconTheme" = "material-icon-theme";
      };

      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        jnoortheen.nix-ide
        bbenoist.nix
        github.copilot
        github.copilot-chat
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cpptools-extension-pack
        ms-azuretools.vscode-docker
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        tamasfe.even-better-toml
        rust-lang.rust-analyzer
      ];
    };
  };
}
