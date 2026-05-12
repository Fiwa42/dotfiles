-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function () 
    hl.exec_cmd("firefox")
    hl.exec_cmd("openrgb")
    hl.exec_cmd("steam")
    hl.exec_cmd("whatsie")
    hl.exec_cmd("discord")
    hl.exec_cmd("tidal-hifi")

    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("hypridle")

    hl.exec_cmd(terminal .. "setxkbmap eu")
    hl.exec_cmd("bash ~/.config/hypr/bash/fullscreen-wallpaper.sh")

    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')

    hl.exec_cmd("hyprctl setcursor [THEME] 24")
end)