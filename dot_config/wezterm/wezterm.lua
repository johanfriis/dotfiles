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

return config
