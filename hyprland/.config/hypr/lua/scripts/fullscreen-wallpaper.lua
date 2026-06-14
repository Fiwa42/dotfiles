local wallpaperDisabled = false
local pendingTimer = nil

local function applyWallpaperState()
    local hasFullscreen = false

    for _, ws in ipairs(hl.get_workspaces()) do
        if ws.has_fullscreen then
            hasFullscreen = true
            break
        end
    end

    if hasFullscreen and not wallpaperDisabled then
        hl.exec_cmd("qs -c noctalia-shell ipc call wallpaper disableAutomation")
        wallpaperDisabled = true

    elseif not hasFullscreen and wallpaperDisabled then
        hl.exec_cmd("qs -c noctalia-shell ipc call wallpaper enableAutomation")
        wallpaperDisabled = false
    end
end

local function delayedUpdate()
    if pendingTimer then
        pendingTimer:set_enabled(false)
    end

    pendingTimer = hl.timer(function()
        applyWallpaperState()
    end, {
        timeout = 10000,
        type = "oneshot",
    })
end

hl.on("window.fullscreen", function()
    delayedUpdate()
end)

hl.on("hyprland.start", function()
    applyWallpaperState()
end)

hl.on("config.reloaded", function()
    applyWallpaperState()
end)