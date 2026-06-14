--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local dp1 = { "1", "2", "3", "4", "5" }
local dp2 = { "6", "7", "8" }
local dp3 = { "9", "10" }

for _, ws in ipairs(dp1) do
    hl.workspace_rule({ workspace = ws, monitor = "DP-1" })
end

for _, ws in ipairs(dp2) do
    hl.workspace_rule({ workspace = ws, monitor = "DP-2" })
end

for _, ws in ipairs(dp3) do
    hl.workspace_rule({ workspace = ws, monitor = "DP-3" })
end

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "idle-inhibit",
    match = { class = ".*" },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    match = { class = "^discord$" },
    workspace = "6 silent",
})

hl.window_rule({
    match = { class = "^steam$" },
    workspace = "2 silent",
})

hl.window_rule({
    match = {
        class = "^steam$",
        initial_title = "^Friends List$",
    },
    workspace = "9 silent",
})

hl.window_rule({
    match = { class = "^io.github.lullabyX.sone$" },
    workspace = "9 silent",
})