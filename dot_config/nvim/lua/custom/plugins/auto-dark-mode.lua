return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  priority = 10,
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme rose-pine-moon")
      require('lualine').setup({
        options = {
          theme = "palenight",
        }
      })
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme rose-pine-dawn")
      local solarized = require('lualine.themes.solarized_light')
      solarized.normal.c.bg = '#f0e9e2'
      require('lualine').setup({
        options = {
          theme = solarized
        }
      })
    end,
  },
}
