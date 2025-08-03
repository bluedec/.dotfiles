
local wezterm = require 'wezterm';

local act = wezterm.action;

local config = wezterm.config_builder();

config.front_end = "OpenGL"; 
config.color_scheme = 'Catppuccin Frappé (Gogh)';
config.font_size = 10.0;
config.initial_rows = 53;
config.initial_cols = 230;
config.window_decorations = "NONE";
config.enable_wayland = false;
config.max_fps = 110;
config.animation_fps = 1;
config.enable_scroll_bar = false;
config.webgpu_power_preference = "HighPerformance";

config.keys = {
	{ key = "s", mods = "ALT", action = act.MoveTabRelative(1) },
	{ key = "a", mods = "ALT", action = act.MoveTabRelative(-1) },
  { key = "s", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
	{ key = "a", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },
	{ key = "m", mods = "SHIFT|ALT", action = act.SpawnTab 'CurrentPaneDomain' },
  -- close 
	{ key = "q", mods = "SHIFT|ALT", action = act.CloseCurrentTab { confirm = true } },
};

return config;
