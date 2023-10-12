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
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  -- {
  --   key = 'm',
  --   mods = 'CMD',
  --   action = wezterm.action.DisableDefaultAssignment,
  -- },

  -- Rebind some command keys to alt
  {
    key = 'g',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'g',
      mods = 'ALT',
    },
  },
  {
    key = 'n',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'n',
      mods = 'ALT',
    },
  },
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'p',
      mods = 'ALT',
    },
  },
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'm',
      mods = 'ALT',
    },
  },
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'p',
      mods = 'ALT',
    },
  },
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 't',
      mods = 'ALT',
    },
  },
  {
    key = 's',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 's',
      mods = 'ALT',
    },
  },
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'c',
      mods = 'ALT',
    },
  },
  {
    key = 'o',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'o',
      mods = 'ALT',
    },
  },
  {
    key = 'q',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'q',
      mods = 'ALT',
    },
  },
  {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'h',
      mods = 'ALT',
    },
  },
  {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'j',
      mods = 'ALT',
    },
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'k',
      mods = 'ALT',
    },
  },
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'l',
      mods = 'ALT',
    },
  },
}

return config
