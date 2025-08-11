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
config.max_fps = 120;
config.animation_fps = 1;
config.enable_scroll_bar = false;
config.webgpu_power_preference = "HighPerformance";

config.keys = {
  -- displace tabs 
	{ key = "s", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },
	{ key = "a", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
  -- move tabs relatively
  { key = "s", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
	{ key = "a", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },
  -- create new tab
	{ key = "m", mods = "SHIFT|ALT", action = act.SpawnTab 'CurrentPaneDomain' },
  -- close current window
	{ key = "w", mods = "SHIFT|ALT", action = act.CloseCurrentTab { confirm = true } },
  -- close current pane
	{ key = "p", mods = "SHIFT|ALT", action = act.CloseCurrentPane { confirm = true } },
  -- split pane vertically
	{ key = "h", mods = "SHIFT|ALT", action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
};

return config;
