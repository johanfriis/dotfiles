local Utils = require("utils")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = require('config.keys').telescope,
    opts = {
      pickers = {
        buffers = {
          results_title = 'Open Buffers',
          prompt_title = 'Search Buffers',
          path_display = { 'smart' },
          layout_strategy = 'vertical',
          layout_config = {
            anchor = 'N',
            -- height = { 0.9, max = 8 },
            height = 0.3,
            prompt_position = 'top',
            preview_height = 0,
          },
          initial_mode = 'normal',
          ignore_current_buffer = true,
          sort_mru = true,
        },
        find_files = {
          preview_height = 0
        }
      },
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-h>"] = "which_key",
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              Utils.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              Utils.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = "cycle_history_next",
            ["<C-Up>"] = "cycle_history_prev",
            ["<C-f>"] = "preview_scrolling_down",
            ["<C-b>"] = "preview_scrolling_up",
          },
          n = {
            ["?"] = "which_key",
            ["q"] = "close",
          },
        },
      },
    },
  }
}
