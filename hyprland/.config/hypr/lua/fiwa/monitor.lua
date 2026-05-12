------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@280",
    position = "1440x600",
    scale    = 1,
    bitdepth = 10,
    vrr      = 2
})

hl.monitor({
    output    = "DP-2",
    mode      = "2560x1440@75",
    position  = "0x0",
    scale     = 1,
    bitdepth  = 10,
    vrr       = 1,
    transform = 1
})

hl.monitor({
    output    = "DP-3",
    mode      = "2560x1440@180",
    position  = "4000x-0",
    scale     = 1,
    bitdepth  = 10,
    vrr       = 1,
    transform = 3
})