local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.5

config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 8,
	right = 8,
	top = 6,
	bottom = 6,
}

config.window_background_opacity = 0.85
config.scrollback_lines = 2000
config.max_fps = 60
config.animation_fps = 60
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
--config.front_end = "WebGpu"
--config.enable_wayland = false

return config
