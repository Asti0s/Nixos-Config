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
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = true;
          "markdown" = true;
        };
        "clangd.arguments" = [
          "--clang-tidy"
          "--background-index"
        ];
        "chat.mcp.gallery.enabled" = true;
      };

      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        bbenoist.nix
        github.copilot
        github.copilot-chat
        llvm-vs-code-extensions.vscode-clangd
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        tamasfe.even-better-toml
        rust-lang.rust-analyzer
        christian-kohler.path-intellisense
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        prisma.prisma
        ms-vscode.cpptools-extension-pack
        ms-vscode.makefile-tools
        ms-azuretools.vscode-docker
        ms-azuretools.vscode-containers
        ms-vscode.cmake-tools
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
      ];
    };
  };
}
