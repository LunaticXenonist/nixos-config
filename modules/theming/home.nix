{pkgs, ...}: let
  # Changing themes should be done here
  theme = {
    kvantum = {
      name = "MateriaDark";
      package = pkgs.materia-kde-theme;
      isDark = true;
    };
    gtk = {
      name = "Materia-dark";
      package = pkgs.materia-theme;

      interface = {
        preferDark = true;
        monospaceFont = "Monospace 10";
        documentFont = "Sans 11";
        defaultFont = "Sans 11";
        clockFormat = "12h";
      };
    };
    icon = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursor = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 24;
    };
  };
  qtXct.config = ''
    [Appearance]
    icon_theme=${theme.icon.name}
    style=kvantum${
      if theme.kvantum.isDark
      then "-dark"
      else ""
    }
    standard_dialogs=default
  '';
  boolToInteger = b:
    if b
    then 1
    else 0;
in {
  # The gtk module isn't actually enabled.
  # We're just settings its values in case other home-manager modules are expecting them.
  gtk = {
    enable = false;

    theme = theme.gtk;
    iconTheme = theme.icon;
    cursorTheme = theme.cursor;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = theme.gtk.name;
      icon-theme = theme.icon.name;
      cursor-theme = theme.cursor.name;
      cursor-size = theme.cursor.size;

      color-scheme =
        if theme.gtk.interface.preferDark
        then "prefer-dark"
        else "prefer-light";
      monospace-font-name = theme.gtk.interface.monospaceFont;
      document-font-name = theme.gtk.interface.documentFont;
      font-name = theme.gtk.interface.defaultFont;
      clock-format = theme.gtk.interface.clockFormat;
    };
  };

  # xsettingsd (must be manually started by compositor)
  xdg.configFile."xsettingsd/xsettingsd.conf".text = ''
    Net/ThemeName "${theme.gtk.name}"
    Net/IconThemeName "${theme.icon.name}"
    Gtk/CursorThemeName "${theme.cursor.name}"
    Gtk/CursorThemeSize ${toString theme.cursor.size}
    Gtk/ApplicationPreferDarkTheme ${toString (boolToInteger theme.gtk.interface.preferDark)}
    Gtk/FontName "${theme.gtk.interface.defaultFont}"
  '';

  xdg.dataFile."icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${theme.cursor.name}
  '';

  # Symlink theme, iconTheme, and cursorTheme to their respective per-user locations
  # so Steam can find since it's running in chroot behind the scenes.
  xdg.dataFile."themes/${theme.gtk.name}" = {
    source = "${theme.gtk.package}/share/themes/${theme.gtk.name}";
  };
  xdg.dataFile."icons/${theme.icon.name}" = {
    source = "${theme.icon.package}/share/icons/${theme.icon.name}";
  };
  xdg.dataFile."icons/${theme.cursor.name}" = {
    source = "${theme.cursor.package}/share/icons/${theme.cursor.name}";
  };

  # GTK 4
  xdg.configFile."gtk-4.0/assets".source = "${theme.gtk.package}/share/themes/${theme.gtk.name}/gtk-4.0/assets";
  xdg.configFile."gtk-4.0/gtk.css".source = "${theme.gtk.package}/share/themes/${theme.gtk.name}/gtk-4.0/gtk.css";
  xdg.configFile."gtk-4.0/gtk-dark.css".source = "${theme.gtk.package}/share/themes/${theme.gtk.name}/gtk-4.0/gtk-dark.css";

  # Needed packages
  home.packages = with pkgs; [
    theme.gtk.package
    theme.icon.package
    theme.cursor.package
    theme.kvantum.package

    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
  ];

  # Link kvantumTheme to $XDG_CONIFG_HOME/Kvantum/${kvantumTheme.name}
  xdg.configFile."Kvantum/${theme.kvantum.name}" = {
    source = "${theme.kvantum.package}/share/Kvantum/${theme.kvantum.name}";
  };

  # Write Kvantum config file with chosen theme
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=${theme.kvantum.name}
  '';

  # Set qt5ct (this also works for qt6ct) as the current theme manager
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  # Set kvantum as theme in qtXct config file
  xdg.configFile."qt5ct/qt5ct.conf".text = qtXct.config;
  xdg.configFile."qt6ct/qt6ct.conf".text = qtXct.config;
}

