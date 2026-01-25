{ config, pkgs, ... }:

# TODO add one switch for installing and other for just config
{
  programs.firefox = {
  # TODO check options
    enable = true;

    languagePacks = [ "en-GB" "pl" "de" ];

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "sidebar.verticalTabs" = true;
        };
      };
    };

    # TODO https://mynixos.com/home-manager/option/programs.firefox.policies
    # https://mozilla.github.io/policy-templates/
    # mini tutorial: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
    # generalnie dodawaj to co cie wkurwia, bo nie ma sensu czytac wszystkiego
    # w pierwszej kolejnosci policies, a w drugiej preferences
    policies = {
      AutofillCreditCardEnabled = false;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableTelemetry = true;

      DisplayBookmarksToolbar = "newtab";

      DontCheckDefaultBrowser = true;

      NoDefaultBookmarks = true;

      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;

      PromptForDownloadLocation = true;

      FirefoxHome = {
        Search = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Locked = true;
      };
      Homepage = {
        StartPage = "previous-session";
      };

      SearchEngines = {
        Default = "DuckDuckGo";
      };

      GenerativeAI = {
        Enabled = false;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";

          installation_mode = "force_installed";
          private_browsing = true;
        };
        "keepassxc-browser@keepassxc.org" = {
          default_area = "navbar"; # can be also: menupanel
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";

          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Kanagawa.nvim theme
        "{7efc2a80-496f-49b1-88db-4ddd7d312757}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4567100/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      Preferences = {
      # here are things from about:config
      # and from https://searchfox.org/firefox-main/source/modules/libpref/init/StaticPrefList.yaml
        "browser.aboutwelcome.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.newtabpage.enabled" = {
          Value = false;
          Status = "locked";
        };

        "browser.translations.enable" = {
          Value = false;
          Status = "locked";
        };
        "browser.translations.automaticallyPopup" = {
          Value = false;
          Status = "locked";
        };

        "browser.uiCustomization.value" = {
          Value = ''
{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["ublock0_raymondhill_net-browser-action"],"nav-bar":["sidebar-button","sync-button","alltabs-button","firefox-view-button","back-button","forward-button","stop-reload-button","urlbar-container","vertical-spacer","keepassxc-browser_keepassxc_org-browser-action","downloads-button","fxa-toolbar-menu-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":[],"vertical-tabs":["tabbrowser-tabs"],"PersonalToolbar":["personal-bookmarks"]},"seen":["keepassxc-browser_keepassxc_org-browser-action","ublock0_raymondhill_net-browser-action","developer-button","screenshot-button"],"dirtyAreaCache":["unified-extensions-area","nav-bar","TabsToolbar","vertical-tabs","toolbar-menubar","PersonalToolbar"],"currentVersion":23,"newElementCount":4}
          '';
#           Value = ''
# {\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"ublock0_raymondhill_net-browser-action\"],\"nav-bar\":[\"sidebar-button\",\"sync-button\",\"alltabs-button\",\"firefox-view-button\",\"back-button\",\"forward-button\",\"stop-reload-button\",\"urlbar-container\",\"vertical-spacer\",\"keepassxc-browser_keepassxc_org-browser-action\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[],\"vertical-tabs\":[\"tabbrowser-tabs\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"keepassxc-browser_keepassxc_org-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"developer-button\"],\"dirtyAreaCache\":[\"unified-extensions-area\",\"nav-bar\",\"TabsToolbar\",\"vertical-tabs\",\"toolbar-menubar\",\"PersonalToolbar\"],\"currentVersion\":23,\"newElementCount\":3}
#           '';
          Status = "locked";
        };
        # TODO check if its working
        # "browser.tabs.drawInTitlebar" = {
        #   Value = true;
        #   Status = "locked";
        # };

        # srAI stuff {{{
        "browser.ml.chat.enabled" = {
          Value = false;
          Status = "locked";
        };

        "browser.ml.chat.sidebar" = {
          Value = false;
          Status = "locked";
        };
        # }}}

        # Search Bar Suggestions and other settings {{{
        "browser.search.suggest.enabled" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.shortcuts.bookmarks" = {
          Value = true;
          Status = "locked";
        };

        "browser.urlbar.shortcuts.history" = {
          Value = true;
          Status = "locked";
        };

        "browser.urlbar.shortcuts.tabs" = {
          Value = true;
          Status = "locked";
        };

        "browser.urlbar.showSearchSuggestionsFirst" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.showSearchTerms.enabled" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.addons" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.calculator" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.clipboard" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.engines" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.history" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.quicksuggest" = {
          Value = false;
          Status = "locked";
        };

        "browser.urlbar.suggest.recentsearches" = {
          Value = false;
          Status = "locked";
        };
        # }}}

        "media.webspeech.synth.enabled" = {
          Value = false;
          Status = "locked";
        };
      };
    };
  };

  # FIX sth sth paths
  # put this in a submodule
  # xdg.desktopEntries.firefox-nixgl = {
  #   name = "Firefox (nixGL)";
  #   exec = "${config.lib.nixGL.wrap pkgs.firefox}/bin/firefox %U";
  #   categories = [ "Network" ];
  #   type = "Application";
  # };
}
