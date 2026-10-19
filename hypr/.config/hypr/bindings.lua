-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
-- omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
-- omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
-- omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
hl.unbind("SUPER + SHIFT + D") -- docker
hl.unbind("SUPER + SHIFT + SLASH") -- 1password
hl.unbind("SUPER + SHIFT + G") -- signal
hl.unbind("SUPER + SHIFT + A") -- chatgpt
hl.unbind("SUPER + SHIFT + C") -- hey calendar
hl.unbind("SUPER + SHIFT + E") -- hey email

o.bind("SUPER + SHIFT + D", "Discord", { launch = "vesktop" }) -- discord
o.bind("SUPER + SHIFT + SLASH", "Passwords", { launch = "bitwarden.desktop" }) -- bitwarden
o.bind("SUPER + SHIFT + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true }) -- whatsapp
o.bind("SUPER + SHIFT + A", "Claude", { webapp = "https://claude.ai/" }) -- claude
o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://calendar.google.com/" }) -- google calendar
o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://gmail.com/" }) -- gmail

-- Disable a default binding without replacing it.
hl.unbind("SUPER + SHIFT + ALT + G") -- whatsapp
hl.unbind("SUPER + SHIFT + CTRL + G") -- google messages
hl.unbind("SUPER + SHIFT + ALT + X") -- x compose
hl.unbind("SUPER + SHIFT + ALT + E") -- hey email
hl.unbind("SUPER + SHIFT + X") -- twitter
hl.unbind("SUPER + SHIFT + S") -- google maps

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Monitor color profiles (hyprmoncfg)
o.bind("SUPER + ALT + D", "Display: SDR desktop", "hyprmoncfg apply desktop --confirm-timeout 0")
o.bind("SUPER + ALT + H", "Display: HDR", "hyprmoncfg apply hdr --confirm-timeout 0")

-- BEGIN Tusche Bar keys (managed)
-- Super+Space / Super+Alt+Space open the Tusche Bar's menu under the logo
-- (search line / Apps list); without the bar, Omarchy's own menus open.
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + ALT + SPACE")
o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-shell tusche-bar search || omarchy-menu toggle root")
o.bind("SUPER + ALT + SPACE", "Apps menu", "omarchy-shell tusche-bar apps || omarchy-menu toggle apps")
-- END Tusche Bar keys (managed)
