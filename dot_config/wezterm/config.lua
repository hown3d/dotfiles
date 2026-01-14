local theme_picker = require("theme_picker")
local wezterm = require("wezterm")
local nerdfonts = wezterm.nerdfonts
local config = {}
-- local config_writer = require("config_writer")
-- local G = config_writer.getLuaFromTOML()
-- local scheme = wezterm.color.get_builtin_schemes()[G.colorscheme]

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Gruvbox Material (Gogh)"
	else
		return "Gruvbox Light"
	end
end

config = {
	default_cursor_style = "BlinkingBar",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	hide_tab_bar_if_only_one_tab = false,
	show_new_tab_button_in_tab_bar = false,
	show_tab_index_in_tab_bar = true,
	status_update_interval = 1000,
	tab_bar_at_bottom = false,
	tab_max_width = 64,
	use_fancy_tab_bar = true,
	scrollback_lines = 1000,
	font_size = 18,
	-- freetype_load_flags = "NO_HINTING",
	font = wezterm.font({
		family = "FiraCode Nerd Font",
		-- 	-- family='Monaspace Neon',
		-- family = "Monaspace Argon Var",
		-- 	-- family='Monaspace Xenon',
		-- 	-- family='Monaspace Radon',
		-- 	-- family='Monaspace Krypton',
		weight = "Medium",
		-- 	-- harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
	}),
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	cell_width = 0.9,

	enable_tab_bar = true,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
	inactive_pane_hsb = {
		brightness = 0.4,
	},

	-- background = {
	-- 	{
	-- 		source = {
	-- 			File = "/Users/hoehll/Pictures/Foto von Ludi, 22. Okt 2024.jpg",
	-- 		},
	-- 		hsb = {
	-- 			hue = 1.0,
	-- 			saturation = 0.9,
	-- 			brightness = 0.15,
	-- 		},
	-- 		width = "100%",
	-- 		height = "100%",
	-- 	},
	-- },
	hyperlink_rules = wezterm.default_hyperlink_rules(),
	keys = {
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
	},
}

require("smart_splits")(config)
-- config.color_scheme = "CustomTheme"
-- config.color_schemes = { ["CustomTheme"] = scheme }
config.color_scheme = scheme_for_appearance(get_appearance())
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

return config
