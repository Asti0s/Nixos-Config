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
        "github.copilot.nextEditSuggestions.enabled" = true;
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "catppuccin-macchiato";
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
      };

      extensions = with pkgs.vscode-extensions; [
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
        christian-kohler.path-intellisense
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        prisma.prisma
        ms-vscode.makefile-tools
      ];
    };
  };
}
