#!/bin/bash
set -e
if [[ "$USER" == 'root' ]]; then
    echo -e "\n\tPlease run script as non-root!\n"
    exit 1
fi

# MOUSEPAD VIEW
gsettings set org.xfce.mousepad.preferences.view indent-width -1
gsettings set org.xfce.mousepad.preferences.view highlight-current-line true
gsettings set org.xfce.mousepad.preferences.view show-right-margin true
gsettings set org.xfce.mousepad.preferences.view font-name 'Monospace'
gsettings set org.xfce.mousepad.preferences.view color-scheme 'solarized-dark'
gsettings set org.xfce.mousepad.preferences.view show-line-numbers true
gsettings set org.xfce.mousepad.preferences.view insert-spaces true
gsettings set org.xfce.mousepad.preferences.view match-braces true
gsettings set org.xfce.mousepad.preferences.view indent-on-tab true
gsettings set org.xfce.mousepad.preferences.view right-margin-position 80
gsettings set org.xfce.mousepad.preferences.view tab-width 4
gsettings set org.xfce.mousepad.preferences.view auto-indent false

# MOUSEPAD WINDOW
gsettings set org.xfce.mousepad.preferences.window menubar-visible false
gsettings set org.xfce.mousepad.preferences.window menubar-visible-in-fullscreen 'auto'
gsettings set org.xfce.mousepad.preferences.window remember-state true
gsettings set org.xfce.mousepad.preferences.window always-show-tabs false
gsettings set org.xfce.mousepad.preferences.window default-tab-sizes '2,4,8'
gsettings set org.xfce.mousepad.preferences.window toolbar-icon-size 'small-toolbar'
gsettings set org.xfce.mousepad.preferences.window toolbar-visible-in-fullscreen 'auto'
gsettings set org.xfce.mousepad.preferences.window remember-size true
gsettings set org.xfce.mousepad.preferences.window cycle-tabs true
gsettings set org.xfce.mousepad.preferences.window statusbar-visible-in-fullscreen 'auto'
gsettings set org.xfce.mousepad.preferences.window remember-position true
gsettings set org.xfce.mousepad.preferences.window toolbar-style 'icons'
gsettings set org.xfce.mousepad.preferences.window toolbar-visible false
gsettings set org.xfce.mousepad.preferences.window statusbar-visible true

# DESKTOP
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface cursor-size '24'

# MESSAGE
echo -e "\n\tDone."

# ARCHIVE
# gsettings set org.xfce.mousepad.preferences.view word-wrap false
# gsettings set org.xfce.mousepad.preferences.view show-line-marks false
# gsettings set org.xfce.mousepad.preferences.view show-line-endings false
# gsettings set org.xfce.mousepad.preferences.view show-whitespace false
# gsettings set org.xfce.mousepad.preferences.view smart-home-end 'disabled'
# gsettings set org.xfce.mousepad.preferences.view use-default-monospace-font
# gsettings set org.xfce.mousepad.preferences.window recent-menu-items 10
# gsettings set org.xfce.mousepad.preferences.window path-in-title false
# gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
# gsettings set com.canonical.indicator.datetime time-format custom
# gsettings set com.canonical.indicator.datetime custom-time-format '%a, %b %-d, %H:%M'
