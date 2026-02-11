local wezterm = require("wezterm")

local M = {}

M.close_all_but_current = function(win, _)
	local tab = win:active_tab()
	local activeTabId = tab:tab_id()
	local muxWin = win:mux_window()
	local tabs = muxWin:tabs()
	for _, t in ipairs(tabs) do
		if t:tab_id() ~= activeTabId then
			t:activate()
			for _, p in ipairs(t:panes()) do
				win:perform_action(wezterm.action.CloseCurrentPane({ confirm = false }), p)
			end
		end
	end
end

return M
