-- BEGIN hyprmoncfg wake settings
-- Shared with Omarchy while hyprmoncfg manages displays.
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 2 })
-- END hyprmoncfg wake settings
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- Scale factors: GDK integer scale for GTK apps, and the Hyprland scale used by the monitor rules
local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 2

-- Export GDK_SCALE so GTK apps render at the correct size
hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Fallback rule: applies to any monitor without a specific rule below
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Main laptop panel: 2880x1800 @ 120Hz, 10-bit color for HDR
hl.monitor({ output = "eDP-1", mode = "2880x1800@120", position = "0x0", scale = omarchy_monitor_scale, bitdepth = 10 })

-- Auto-switch to HDR (PQ) only when fullscreen content requests it, keeping the desktop in SDR.
hl.config({ render = { cm_auto_hdr = 1 } })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
