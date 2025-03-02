local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- automatically reload config
config.automatically_reload_config = true

config.enable_tab_bar = false

config.max_fps = 120

if wezterm.running_under_wsl() == true or wezterm.target_triple == "x86_64-pc-windows-msvc" then
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
-- config.window_background_opacity = 0.90
-- config.win32_system_backdrop = "Acrylic"
-- config.macos_window_background_blur = 20

config.colors = {
	-- background = "#181825",
	background = "#11111b",
}

-- and finally, return the configuration to wezterm
return config
