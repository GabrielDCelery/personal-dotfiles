-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.default_domain = 'WSL:Ubuntu'

-- Automatically reload config
config.automatically_reload_config = true

-- Style
-- config.color_scheme = 'Default (dark) (terminal.sexy)'

config.color_scheme = 'Dark Pastel (Gogh)'

-- and finally, return the configuration to wezterm
return config
