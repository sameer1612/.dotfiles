local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config = {
	window_decorations = "RESIZE",
	window_padding = { bottom = 0, right = 0 },

	color_scheme = "Gruvbox dark, medium (base16)",
	font = wezterm.font("VictorMono Nerd Font", { weight = "Regular" }),
	font_size = 18,

	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	show_close_tab_button_in_tabs = false,
	show_new_tab_button_in_tab_bar = false,
	show_tab_index_in_tab_bar = false,

	scrollback_lines = 10000,
	window_close_confirmation = "NeverPrompt",

	keys = {
		{ mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
		{ mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
		{ mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
		{ mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
		{ mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
		{
			mods = "CMD|SHIFT",
			key = "Enter",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{ mods = "CMD", key = "Enter", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{
			key = ",",
			mods = "CMD",
			action = action.SpawnCommandInNewTab({
				cwd = os.getenv("WEZTERM_CONFIG_DIR"),
				args = {
					"/opt/homebrew/bin/nvim",
					os.getenv("WEZTERM_CONFIG_FILE"),
				},
			}),
		},
	},
}

return config
