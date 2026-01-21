local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- automatically reload config
config.automatically_reload_config = true

config.enable_tab_bar = false

config.max_fps = 120

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

config.font_size = 14

config.colors = {
	-- background = "#181825",
	background = "#11111b",
}

-- config.keys = {
-- 	-- Shouldn't conflict with linux/windows
-- 	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
-- 	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
-- 	-- Make Option-Right equivalent to Alt-f; forward-word
-- 	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
-- }
config.background = {
	{
		source = {
			-- File = wezterm.config_dir .. "/wallpapers/sakura-trees-over-river.jpg",
			-- File = wezterm.config_dir .. "/wallpapers/wuwa-galbrena-001.jpg",
			File = wezterm.config_dir .. "/wallpapers/pyramid-003.png",
			-- File = wezterm.config_dir .. "/wallpapers/sakura-gate.jpg",
			-- File = wezterm.config_dir .. "/wallpapers/waves.png",
		},
	},
	{
		source = {
			Color = "#11111b",
		},
		width = "100%",
		height = "104%",
		opacity = 0.9,
	},
}

-- and finally, return the configuration to wezterm
return config
