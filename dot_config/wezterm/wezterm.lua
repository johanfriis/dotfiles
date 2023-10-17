local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder() then
	config = wezterm.config_builder()
end

-- // COLOR SCHEME

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

local function scheme_for_appearance(appearance)
	if appearance:find 'Dark' then
		return 'rose-pine-moon'
	else
		return 'rose-pine-dawn'
	end
end

local function colors_for_appearance(appearance)
	if appearance:find 'Dark' then
		return {
			selection_fg = '#e0def4',
			selection_bg = '#44415a'
		}
	else
		return {
			selection_fg = '#575279',
			selection_bg = '#cecacd'
		}
	end
end

local function swap_cmd_and_alt(key)
	return {
		key = key,
		mods = 'CMD',
		action = wezterm.action.SendKey {
			key = key,
			mods = 'ALT',
		},
	}
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.colors = colors_for_appearance(get_appearance())

-- // FONT
--
config.font = wezterm.font("CaskaydiaCove Nerd Font", {
	weight = "Regular",
	stretch = "Normal",
	style = "Normal",
	italic = true,
})
config.font_size = 13


-- // UI
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = 'm',
		mods = 'CMD',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'h',
		mods = 'CMD',
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- open t - tmux smart session manager
	{
		key = 'j',
		mods = 'CMD',
		action = wezterm.action.SendString '\x02\x74'
	},

	-- Rebind some command keys to alt
	-- swap_cmd_and_alt('g'),
	-- swap_cmd_and_alt('n'),
	-- swap_cmd_and_alt('p'),
	-- swap_cmd_and_alt('m'),
	-- swap_cmd_and_alt('t'),
	-- swap_cmd_and_alt('s'),
	-- swap_cmd_and_alt('c'),
	-- swap_cmd_and_alt('o'),
	-- swap_cmd_and_alt('q'),
	-- swap_cmd_and_alt('h'),
	-- swap_cmd_and_alt('j'),
	-- swap_cmd_and_alt('k'),
	-- swap_cmd_and_alt('l'),
	-- swap_cmd_and_alt('['),
	-- swap_cmd_and_alt(']'),
}



return config
