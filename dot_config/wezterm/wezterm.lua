local wezterm = require("wezterm")

local config = require("config")
-- require("events")

wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
