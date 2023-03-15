return {
  {
    'mickael-menu/zk-nvim',
    config = function()
      require('zk').setup({
        picker = 'telescope',
        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { 'zk', 'lsp' },
            name = 'zk',
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },
          auto_attach = {
            enabled = false,
            filetypes = { 'markdown' },
          },
        },
      })
    end,
  },
}
