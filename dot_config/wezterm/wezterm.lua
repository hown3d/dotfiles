local wezterm = require("wezterm")
local config = require("config")
local config_writer = require("config_writer")
local theme_picker = require("theme_picker")
local smart_splits = require("smart_splits")
local G = config_writer.getLuaFromTOML()
require("events")

local scheme = wezterm.color.get_builtin_schemes()[G.colorscheme]
config.color_scheme = "CustomTheme"
config.color_schemes = { ["CustomTheme"] = scheme }

config.keys = {
	{ key = "m", mods = "CMD|CTRL", action = wezterm.action_callback(theme_picker.theme_switcher) },
	-- This will create a new split and run your default program inside it
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal,
	},
	{
		key = "Enter",
		mods = "SHIFT|CMD",
		action = wezterm.action.SplitVertical,
	},
	{
		key = "d",
		mods = "SHIFT|CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
smart_splits(config)

return config
