
---------------------
---- MY PROGRAMS ----
---------------------
local chrome = "google-chrome-stable"
local gimp = "gimp --new-instance"
local terminal = "wezterm"
local discord = "discordptb"
local spotify = "spotify"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd(chrome)
    hl.exec_cmd(terminal)
    hl.exec_cmd(discord)
    hl.exec_cmd(gimp)
    hl.exec_cmd(spotify)
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    -- hl.exec_cmd("hyprpaper")
end)
