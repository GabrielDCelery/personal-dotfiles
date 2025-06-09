local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- automatically reload config
config.automatically_reload_config = true

config.enable_tab_bar = false

config.max_fps = 120

-- Only set default domain when running under WSL
local is_windows = wezterm.target_triple:find("windows") ~= nil
if is_windows then
	config.default_domain = "WSL:Ubuntu"
end

-- use catppuccin theme
config.color_scheme = "Catppuccin Mocha"

-- set font
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font({
	family = "JetBrains Mono",
	-- disable ligatures
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

-- window padding
config.window_padding = {
	bottom = "0px",
}

config.audible_bell = "Disabled"

config.font_size = 12

config.colors = {
	-- background = "#181825",
	background = "#11111b",
}

config.keys = {
	-- Shouldn't conflict with linux/windows
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
}

config.hide_mouse_cursor_when_typing = false

-- and finally, return the configuration to wezterm
return config
