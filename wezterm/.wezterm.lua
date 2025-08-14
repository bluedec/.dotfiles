local wezterm = require 'wezterm';

local act = wezterm.action;

local config = wezterm.config_builder();

--config.font = wezterm.font_with_fallback { 'monospace', 'JetBrains Mono' }
config.font = wezterm.font('JetBrains Mono')


config.automatically_reload_config = true
config.front_end = "OpenGL";
--config.color_scheme = 'Catppuccin Frappé (Gogh)';
---config.color_scheme = 'Zenburn (base16)';
config.color_scheme = 'wilmersdorf'
config.font_size = 10.0;
config.initial_rows = 53;
config.initial_cols = 230;
config.window_decorations = "NONE";
config.enable_wayland = false;
config.max_fps = 120;
config.animation_fps = 1;
config.enable_scroll_bar = false;
config.webgpu_power_preference = "HighPerformance";

config.warn_about_missing_glyphs = false;


config.keys = {
  -- displace tabs 
	{ key = "s", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },
	{ key = "a", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
  -- move from tabs relatively
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
  -- make font smaller
  { key = "+", mods = "SHIFT|ALT", action = wezterm.action.IncreaseFontSize },
  -- make font bigger
	{ key = "_", mods = "SHIFT|ALT", action = wezterm.action.DecreaseFontSize },
  -- reload config
  { key = 'r', mods = 'CMD|SHIFT', action = wezterm.action.ReloadConfiguration },

};

return config;
