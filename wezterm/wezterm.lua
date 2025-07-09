-- stylua: ignore start
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Font and appearance
config.font = wezterm.font("JetBrains Mono", { weight = 400 })
-- DejaVu Sans Mono
config.font_size = 14.0

-- Colors and theme
config.color_scheme = "Tokyo Night"

-- Window settings
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- Keybind settings
  -- Set wezterm-leader
config.leader = {key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

  -- Pane splitting
config.keys = {
  {
    key = "t",
    mods = "LEADER",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  -- Leader to tab num
  { key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(8) },

  {
    key = "%",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '"',
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Pane navigation
  {
  key = "h",
  mods = "LEADER",
  action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  -- Reload config
  {
    key = "r",
    mods = "LEADER",
    action = wezterm.action.ReloadConfiguration,
  },

  -- Standard copy/paste
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = wezterm.action.PasteFrom "Clipboard",
  },
  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CopyTo "Clipboard",
  },
  {
    key = "s",
    mods = "SHIFT|CTRL",
    action = wezterm.action.Search "CurrentSelectionOrEmptyString",
  },

  -- Primeagen-style keybinds
  {
    key = "Enter",
    mods = "ALT",
    action = wezterm.action.ToggleFullScreen },
}


config.mouse_bindings = {
	-- Right click paste
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom "Clipboard",
	},
}

config.set_environment_variables = {
	TERM = "wezterm",
}

config.default_prog = { "zsh", "-l" }
-- Disable tab bar if you're using virtual desktops
config.enable_tab_bar = true

-- Performance
config.scrollback_lines = 10000
config.enable_scroll_bar = false

config.audible_bell = "Disabled"

config.warn_about_missing_glyphs = false

return config
