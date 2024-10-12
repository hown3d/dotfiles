local wezterm = require("wezterm")
local smart_path = os.getenv("HOME") .. "/.local/share/nvim/lazy/smart-splits.nvim/"
local smart_splits = wezterm.plugin.require(smart_path)
return function(config)
	-- you can put the rest of your Wezterm config here
	smart_splits.apply_to_config(config, {
		-- the default config is here, if you'd like to use the default keys,
		-- you can omit this configuration table parameter and just use
		-- smart_splits.apply_to_config(config)

		-- directional keys to use in order of: left, down, up, right
		direction_keys = { "h", "j", "k", "l" },
		-- if you want to use separate direction keys for move vs. resize, you
		-- can also do this:
		direction_keys = {
			move = { "h", "j", "k", "l" },
			resize = { "h", "j", "k", "l" },
		},
		-- modifier keys to combine with direction_keys
		modifiers = {
			move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
			resize = "ALT|SHIFT", -- modifier to use for pane resize, e.g. ALT+h to resize to the left
		},
	})
end
