local wezterm = require("wezterm")
local mux = wezterm.mux
local nerdfonts = wezterm.nerdfonts
local fs = require("utils.fs")

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
-- Events update status
wezterm.on("update-status", function(window, pane)
	local config = window:effective_config()
	local colors = config.color_schemes[config.color_scheme]
	-- Workspace name
	local stat = window:active_workspace()
	local workspace_color = colors.ansi[3]
	local time = wezterm.strftime("%Y-%m-%d %H:%M")

	if window:active_key_table() then
		stat = window:active_key_table()
		workspace_color = colors.ansi[4]
	elseif window:leader_is_active() then
		stat = "leader"
		workspace_color = colors.ansi[2]
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			-- Wezterm introduced the URL object in 20240127-113634-bbcac864
			if string.len(cwd.path) > 32 then
				cwd = ".." .. string.sub(cwd.path, -32, -1)
			else
				cwd = cwd.path
			end
		end
	else
		cwd = ""
	end

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Background = { Color = colors.background } },
		{ Text = " " },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = workspace_color } },
		{ Text = nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = workspace_color } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.cod_terminal_tmux .. " " },
		{ Background = { Color = colors.ansi[1] } },
		{ Foreground = { Color = colors.foreground } },
		{ Text = " " .. stat },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.ple_right_half_circle_thick .. " " },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		--
		{ Text = " " },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[5] } },
		{ Text = nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = colors.ansi[5] } },
		{ Foreground = { Color = colors.background } },
		{ Text = nerdfonts.md_folder .. " " },
		{ Background = { Color = colors.ansi[1] } },
		{ Foreground = { Color = colors.foreground } },
		{ Text = " " .. cwd },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.ple_right_half_circle_thick },

		{ Text = " " },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[6] } },
		{ Text = nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = colors.ansi[6] } },
		{ Foreground = { Color = colors.background } },
		{ Text = nerdfonts.fa_user .. " " },
		{ Background = { Color = colors.ansi[1] } },
		{ Foreground = { Color = colors.foreground } },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.ple_right_half_circle_thick },

		{ Text = " " },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[7] } },
		{ Text = nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = colors.ansi[7] } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.cod_server .. " " },
		{ Background = { Color = colors.ansi[1] } },
		{ Foreground = { Color = colors.foreground } },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.ple_right_half_circle_thick },

		{ Text = " " },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[8] } },
		{ Text = nerdfonts.ple_left_half_circle_thick },
		{ Background = { Color = colors.ansi[8] } },
		{ Foreground = { Color = colors.background } },
		{ Text = nerdfonts.md_calendar_clock .. " " },
		{ Background = { Color = colors.ansi[1] } },
		{ Foreground = { Color = colors.foreground } },
		{ Text = " " .. time },
		{ Background = { Color = colors.background } },
		{ Foreground = { Color = colors.ansi[1] } },
		{ Text = nerdfonts.ple_right_half_circle_thick },
	}))
end)

wezterm.on("format-window-title", function(tab, pane, tabs, _, _)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end

	local index = ""
	if #tabs > 1 then
		index = ("[%d/%d] "):format(tab.tab_index + 1, #tabs)
	end

	---tab title
	local title = fs.basename(pane.title):gsub("%.exe%s?$", "")
	local proc = fs.basename(pane.foreground_process_name)
	if proc == "nvim" or title == "cmd" then
		local cwd, _ = fs.basename(pane.current_working_dir.file_path)
		wezterm.log_info(("proc %s"):format(proc))
		title = ("Neovim (dir: %s)"):format(cwd)
	end

	return zoomed .. index .. title
end)

-- Events define tab title
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local colors = config.color_schemes[config.color_scheme]
	-- Define window title
	local tab_title = function(tab_info)
		local title = tab_info.tab_title
		-- if the tab title is explicitly set, take that
		if title and #title > 0 then
			return title
		end
		-- Otherwise, use the title from the active pane in that tab
		return fs.basename(tab_info.active_pane.title)
	end

	local pane = tab.active_pane
	local title = tab_title(tab) .. " "
	local tab_number = " " .. tostring(tab.tab_index + 1)

	-- Default tab title
	local icon = nerdfonts.dev_terminal .. " " .. title

	-- Add zoom icon
	if pane.is_zoomed then
		icon = nerdfonts.cod_zoom_in .. " " .. icon
	end

	local proc = fs.basename(tab.active_pane.foreground_process_name)
	if proc == "nvim" then
		icon = nerdfonts.custom_neovim .. " " .. title
	-- elseif proc == "k9s" then
	-- 	local kubeconfig_path = assert(os.getenv("KUBECONFIG"))
	-- 	local file = assert(io.open(kubeconfig_path, "r"))
	-- 	local yaml = file:read("a")
	-- 	file:close()
	-- 	local kubeconfig = wezterm.serde.yaml_decode(yaml)
	-- 	icon = nerdfonts.md_kubernetes .. kubeconfig.current_context .. " "
	elseif proc ~= fs.basename(os.getenv("SHELL")) then
		icon = icon .. proc .. " "
	end

	-- Add copy icon
	if string.find(pane.title, "^Copy mode:") then
		icon = nerdfonts.md_content_copy .. " " .. icon
	end

	if tab.is_active then
		return {
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.background } },
			{ Text = nerdfonts.ple_left_half_circle_thick },
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.ansi[4] } },
			{ Text = icon },
			{ Background = { Color = colors.foreground } },
			{ Foreground = { Color = colors.background } },
			{ Text = tab_number },
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.foreground } },
			{ Text = nerdfonts.ple_right_half_circle_thick .. " " },
		}
	else
		return {
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.background } },
			{ Text = nerdfonts.ple_left_half_circle_thick },
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.ansi[1] } },
			{ Text = icon },
			{ Background = { Color = colors.ansi[1] } },
			{ Foreground = { Color = colors.background } },
			{ Text = tab_number },
			{ Background = { Color = colors.background } },
			{ Foreground = { Color = colors.ansi[1] } },
			{ Text = nerdfonts.ple_right_half_circle_thick .. " " },
		}
	end
end)
