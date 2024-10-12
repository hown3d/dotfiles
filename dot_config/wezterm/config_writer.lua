local wezterm = require("wezterm")

local M = {}
M.globals_path = wezterm.config_dir .. "/globals.yaml"

M.getLuaFromTOML = function(path)
	local file = assert(io.open(path or M.globals_path, "r"))
	local yaml = file:read("a")
	file:close()
	return wezterm.serde.yaml_decode(yaml)
end
return M
