local Icons = require('user.config.icons')

local excluded_lsp_clients = { ['null-ls'] = true }

return {
  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function(_)
      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl
            and hl.foreground
            and { fg = string.format('#%06x', hl.foreground) }
        end
      end

      return {
        options = {
          theme = 'auto',
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'lazy', 'alpha' } },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
          },
          lualine_b = { 'branch' },
          lualine_c = {
            {
              'diagnostics',
              symbols = {
                error = Icons.diagnostics.Error,
                warn = Icons.diagnostics.Warn,
                info = Icons.diagnostics.Info,
                hint = Icons.diagnostics.Hint,
              },
            },
            {
              'filetype',
              icon_only = true,
              separator = '',
              padding = {
                left = 1,
                right = 0,
              },
            },
            {
              'filename',
              path = 1,
              symbols = { modified = '  ', readonly = '', unnamed = '' },
            },
            {
              function()
                return require('nvim-navic').get_location()
              end,
              cond = function()
                return package.loaded['nvim-navic']
                  and require('nvim-navic').is_available()
              end,
            },
          },
          lualine_x = {
            {
              function()
                return require('noice').api.status.command.get()
              end,
              cond = function()
                return package.loaded['noice']
                  and require('noice').api.status.command.has()
              end,
              color = fg('Statement'),
            },
            {
              function()
                return require('noice').api.status.mode.get()
              end,
              cond = function()
                return package.loaded['noice']
                  and require('noice').api.status.mode.has()
              end,
              color = fg('Constant'),
            },
            {
              require('lazy.status').updates,
              cond = require('lazy.status').has_updates,
              color = fg('Special'),
            },
            {
              'diff',
              symbols = {
                added = Icons.git.added,
                modified = Icons.git.modified,
                removed = Icons.git.removed,
              },
            },
          },
          lualine_y = {
            {
              function()
                local clients = {}

                for _, client in pairs(vim.lsp.get_active_clients()) do
                  if
                    client ~= ''
                    and client ~= nil
                    and excluded_lsp_clients[client.name] ~= true
                  then
                    table.insert(clients, client.name)
                  end
                end

                return table.concat(clients, ' | ')
              end,
            },
          },
          lualine_z = {
            {
              'progress',
              separator = ' ',
              padding = { left = 1, right = 0 },
            },
            { 'location', padding = { left = 0, right = 1 } },
          },
        },
        extensions = { 'neo-tree' },
      }
    end,
  },
}
