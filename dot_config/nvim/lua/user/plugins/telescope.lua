return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    opts = {
      pickers = {
        buffers = {
          results_title = false,
          prompt_title = 'Search Buffers',
          sort_mru = true,
          -- initial_mode = 'normal',
          sorting_strategy = 'ascending',
          ignore_current_buffer = true,
          layout_strategy = 'center',
          layout_config = {
            anchor = 'N',
            preview_cutoff = 999999999999,
            width = 0.4,
            height = 0.3,
          },
        },
      },
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        -- initial_mode = 'normal',
        mappings = {
          i = {
            ['<c-h>'] = 'which_key',
            ['<C-Down>'] = 'cycle_history_next',
            ['<C-Up>'] = 'cycle_history_prev',
            ['<C-f>'] = 'preview_scrolling_down',
            ['<C-b>'] = 'preview_scrolling_up',
          },
          n = {
            ['?'] = 'which_key',
            ['q'] = 'close',
          },
        },
      },
    },
  },

  {
    'danielfalk/smart-open.nvim',
    branch = '0.1.x',
    dependencies = {
      'kkharji/sqlite.lua',
    },
    config = function()
      require('telescope').load_extension('smart_open')
    end,
  },
}
