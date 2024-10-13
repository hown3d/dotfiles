local M = {}
---Equivalent to POSIX `basename(3)`.
---
---This function extracts the base name (the final component) from a given path.
---
---@param path string Any string representing a path.
M.basename = function(path)
	return string.gsub(path, "(.*[/\\])(.*)", "%2")
end
return M
