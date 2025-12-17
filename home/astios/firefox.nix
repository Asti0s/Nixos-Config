{
  programs = {
    firefox = {
      enable = true;
      languagePacks = [
        "fr-FR"
        "en-US"
      ];

      profiles.default = {
        settings = {
          "browser.aboutConfig.showWarning" = false;
        };
      };

      # ---- POLICIES ----
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DontCheckDefaultBrowser = true;

        # ---- EXTENSIONS ----
        # Check about:support for extension/add-on ID strings.
        ExtensionSettings = {
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "normal_installed";
            private_browsing = true;
          };

          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "normal_installed";
            private_browsing = true;
          };

          # Dashlane
          "jetpack-extension@dashlane.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/dashlane/latest.xpi";
            installation_mode = "normal_installed";
          };

          # Return youtube dislikes
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
            installation_mode = "normal_installed";
          };

          # Sponsorblock
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "normal_installed";
          };

          # SteamDB
          "firefox-extension@steamdb.info" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/steam-database/latest.xpi";
            installation_mode = "normal_installed";
          };

          # Simple translate
          "simple-translate@sienori" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple-translate/latest.xpi";
            installation_mode = "normal_installed";
          };

          # Web Archive
          "{d07ccf11-c0cd-4938-a265-2a4d6ad01189}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/view-page-archive/latest.xpi";
            installation_mode = "normal_installed";
          };

          # ClearUrls
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
            installation_mode = "normal_installed";
            private_browsing = true;
          };

          # Consent-O-Matic
          "gdpr@cavi.au.dk" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
            installation_mode = "normal_installed";
            private_browsing = true;
          };

          # Hide youtube shorts
          "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/hide-youtube-shorts/latest.xpi";
            installation_mode = "normal_installed";
          };

          # Phantom
          "{7c42eea1-b3e4-4be4-a56f-82a5852b12dc}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/phantom-app/latest.xpi";
            installation_mode = "normal_installed";
          };

          # MetaMask
          "webextension@metamask.io" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ether-metamask/latest.xpi";
            installation_mode = "normal_installed";
          };

          # Catpuccin theme
          "{d49033ac-8969-488c-afb0-5cdb73957f41}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-macchiato-blue/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
      };
    };
  };
}
