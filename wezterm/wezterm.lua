local wezterm = require 'wezterm';

local act = wezterm.action;
local config = wezterm.config_builder();


--config.font = wezterm.font_with_fallback { 'monospace', 'JetBrains Mono' }
config.font = wezterm.font('JetBrains Mono')

config.automatically_reload_config = true
-- config.color_scheme = 'Catppuccin Frappé (Gogh)';
config.color_scheme = 'Catppuccin Mocha';
--config.color_scheme = 'Zenburn (base16)';
--config.color_scheme = 'wilmersdorf'
config.font_size = 11.0;
config.initial_rows = 53;
config.initial_cols = 230;
config.enable_wayland = true;
config.max_fps = 240;
config.animation_fps = 1;
config.enable_scroll_bar = false;
config.warn_about_missing_glyphs = false;

wezterm.on('gui-startup', function(cmd)
  -- Startup stuff
end)

-- Spawns front and back folders with respective terminals
wezterm.on('spawn-main-workplace', function(window, pane)
  local mux_window = pane:tab():window()
  --  Frontend
  local f_tab = mux_window:spawn_tab {
    cwd = "/home/bluedec/Personal/proyects/casa-tona/casa-tona-frontend",
  }
  local f_second_tab, f_second_pane, _ = mux_window:spawn_tab{}
  f_tab:set_title 'FRONTEND'
  f_second_tab:set_title 'FRONTEND-TERM'
  f_second_pane:split { size = 0.3 }

  --  Backend
  local b_tab = mux_window:spawn_tab {
    cwd = "/home/bluedec/Personal/proyects/casa-tona/casa-tona-backend",
  }
  local b_second_tab, b_second_pane = mux_window:spawn_tab{}
  b_tab:set_title 'BACKEND'
  b_second_tab:set_title 'BACKEND-TERM'
  b_second_pane:split { size = 0.3 }
end)


config.leader = { key = '`', mods = 'CTRL' }
config.keys = {
  { -- Open backend and frontend on new tabs
  key = 'F1', mods = 'NONE', action = act.EmitEvent("spawn-main-workplace")
  },
  -- displace tabs 
	{ key = "s", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },
	{ key = "a", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },

  -- move from tabs relatively
  { key = "s", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
	{ key = "a", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },

  -- move between panes relatively
  { key = "k", mods = "SHIFT|ALT", action = act.ActivatePaneDirection 'Up' },
  { key = "j", mods = "SHIFT|ALT", action = act.ActivatePaneDirection 'Down' },
  { key = "h", mods = "SHIFT|ALT", action = act.ActivatePaneDirection 'Left' },
  { key = "l", mods = "SHIFT|ALT", action = act.ActivatePaneDirection 'Right' },

  -- adjust pane size
  { key = "k", mods = "LEADER", action = act.AdjustPaneSize { 'Up', 5 } },
  { key = "j", mods = "LEADER", action = act.AdjustPaneSize { 'Down', 5 } },
  { key = "h", mods = "LEADER", action = act.AdjustPaneSize { 'Left', 5 } },
  { key = "l", mods = "LEADER", action = act.AdjustPaneSize { 'Right', 5 } },

  -- create new tab
	{ key = "m", mods = "SHIFT|ALT", action = act.SpawnTab 'CurrentPaneDomain' },

  -- close current window
	{ key = "w", mods = "SHIFT|ALT", action = act.CloseCurrentTab { confirm = true } },

  -- close current pane
	{ key = "p", mods = "SHIFT|ALT", action = act.CloseCurrentPane { confirm = true } },

  -- split pane vertically
	{ key = "\r", mods = "SHIFT|ALT", action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

  -- make font smaller
  { key = "+", mods = "SHIFT|ALT", action = act.IncreaseFontSize },

  -- make font bigger
	{ key = "_", mods = "SHIFT|ALT", action = act.DecreaseFontSize },

  -- reload config
  { key = 'r', mods = 'CMD|SHIFT', action = act.ReloadConfiguration },

  -- open current folder with nvim
  { key = "F9", mods = "NONE", action = act.SendString("nvim .\n") },
};


return config;
