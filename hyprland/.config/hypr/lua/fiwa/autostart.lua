-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function () 
    hl.exec_cmd("firefox", {workspace = "1 silent"})
    hl.exec_cmd("steam steam://open/friends", {workspace = "2 silent"})
    hl.exec_cmd("discord", {workspace = "6 silent"})
    hl.exec_cmd("flatpak run io.github.lullabyX.sone", {workspace = "9 silent"})

    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("openrgb --server --profile purple.orp")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("kdeconnectd")

    hl.exec_cmd("setxkbmap eu")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-size 24')
end)