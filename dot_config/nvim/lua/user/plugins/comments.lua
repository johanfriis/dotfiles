return {

  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      hooks = {
        pre = function()
          require('ts_context_commentstring.internal').update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },

  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },

  {
    'folke/todo-comments.nvim',
    -- cmd = { "TodoTrouble", "TodoTelescope" },
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
    --keys = require('config.keys').todo_comments,
  },
}
