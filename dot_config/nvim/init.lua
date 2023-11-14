-- {{{ Install package manager
--     https://github.com/folke/lazy.nvim
--     `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- {{{ Setup map leader
--     This must happen before plugins are required
--     or the wrong leader will be used
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- }}}

-- {{{ Helper Functions
local function telescope_find_buffers()
  require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({
    initial_mode = "normal",
    winblend = 0,
    previewer = false,
  }))
end

local function telescope_find_files()
  local builtin = require("telescope.builtin")

  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    builtin.git_files()
  else
    builtin.find_files()
  end
end
-- }}}

-- {{{ Install and configure plugins
require("lazy").setup({

  -- {{{ WHICH-KEY
  --     https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end,
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>f"] = { name = "[F]ind" },
        ["<leader>d"] = { name = "[D]iagnostics" },
        ["<leader>c"] = { name = "[C]hat" },
      })
    end,
  },
  -- }}}

  -- {{{ THEME - rose-pine-moon
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine-moon")
    end,
  },
  -- }}}

  -- {{{ AUTO-DARK-MODE
  --     https://github.com/f-person/auto-dark-mode.nvim
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 10,
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme rose-pine-moon")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme rose-pine-dawn")
      end,
    },
  },
  -- }}}

  -- {{{ TELESCOPE
  --     https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = "close",
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
          n = {
            ["<esc>"] = "close",
            ["q"] = "close",
          },
        },
      },
    },
    keys = {
      { "<leader>b",  telescope_find_buffers,                           "n", desc = "Open Buffer List" },
      { "<leader>?",  "<cmd>Telescope help_tags<CR>",                   "n", desc = "Help" },
      { "<leader>o",  telescope_find_files,                             "n", desc = "[O]pen (Quick)" },
      { "<leader>ff", telescope_find_files,                             "n", desc = "[F]ind [F]iles" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                   "n", desc = "[F]ind with [G]rep" },
      { "<leader>fd", "<cmd>Telescope diagnostics<CR>",                 "n", desc = "[F]ind [D]iagnostics" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                    "n", desc = "[F]ind [R]ecent Files" },
      { "<leader>fs", "<cmd>Telescope session-lens search_session<CR>", "n", desc = "[F]ind [S]ession" },
      { "gd",         "<cmd>Telescope lsp_definitions<cr>",             "n", desc = "[G]oto [D]efinition" },
      { "gr",         "<cmd>Telescope lsp_references<cr>",              "n", desc = "[G]oto [R]eference" },
    },
  },
  -- }}}

  -- {{{ TREESITTER
  --     https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "lua",
          "elixir",
          "eex",
          "heex",
          "surface",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "yaml",
          "toml",
          "markdown",
          "bash",
          "fish",
          "comment",
          "git_config",
          "gitcommit",
          "gitignore",
          "dockerfile",

        },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-k>",
            node_incremental = "<c-k>",
            scope_incremental = "<c-k>",
            node_decremental = "<M-space>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      })
    end
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    enable = false,
  },
  -- https://github.com/andymass/vim-matchup/
  {
    "andymass/vim-matchup"
  },
  -- }}}

  -- {{{ RAINBOW DELIMITERS (DISABLED)
  --     https://github.com/hiphish/rainbow-delimiters.nvim
  {
    "hiphish/rainbow-delimiters.nvim",
    enabled = false
  },
  -- }}}

  -- {{{ AUTO-SESSION
  --     https://github.com/rmagatti/auto-session
  {
    'rmagatti/auto-session',
    config = function()
      require("telescope").load_extension("session-lens")
      require('auto-session').setup({
        log_level = "error",
        session_lens = {
          initial_mode = "normal",
          winblend = 0,
          previewer = false,
        }
      })
    end,
  },
  -- }}}

  -- {{{ TROUBLE
  --     https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>dd", "<cmd>TroubleToggle document_diagnostics<CR>",  "n", desc = "Document Diagnostics" },
      { "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<CR>", "n", desc = "Workspace Diagnostics" },
      { "<leader>dq", "<cmd>TroubleToggle quickfix<CR>",              "n", desc = "Quickfix" },
      { "<leader>dl", "<cmd>TroubleToggle loclist<CR>",               "n", desc = "Loclist" },
    },
  },
  -- }}}

  -- {{{ LUALINE
  --     https://github.com/nvim-lualine/lualine.nvim
  {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = "rose-pine",
        component_separators = "|",
        section_separators = "",
      },
      -- extensions = {
      --   "neo-tree",
      -- },
    },
  },
  -- }}}

  -- {{{ COMMENT
  --     https://github.com/numToStr/Comment.nvim
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  -- }}}

  -- {{{ CONFORM
  --     https://github.com/stevearc/conform.nvim
  --     Lightweight yet powerful formatter plugin for Neovim
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    },
  },
  -- }}}

  -- {{{ TMUX
  --     https://github.com/aserowy/tmux.nvim
  {
    "aserowy/tmux.nvim",
    opts = {},
  },
  -- }}}

  -- {{{ NEO-TREE
  --     https://github.com/nvim-neo-tree/neo-tree.nvim
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     require("neo-tree").setup({
  --       close_if_last_window = false,
  --       enable_git_status = true,
  --       enable_diagnostics = true,
  --       window = {
  --         width = 40,
  --         mappings = {
  --           ["o"] = "open",
  --           ["u"] = "navigate_up",
  --         },
  --       },
  --       buffers = {
  --         follow_current_file = {
  --           enabled = true,
  --           leave_dirs_open = true,
  --         },
  --       },
  --       filesystem = {
  --         follow_current_file = {
  --           enabled = true,
  --           leave_dirs_open = true,
  --         },
  --         filtered_items = {
  --           hide_dotfiles = false,
  --           hide_gitignored = false,
  --           hide_by_name = {
  --             "node_modules"
  --           },
  --           never_show = {
  --             ".DS_Store",
  --             "thumbs.db"
  --           },
  --         },
  --       },
  --     })
  --
  --     vim.keymap.set('n', '<leader>e',
  --       ':Neotree action=focus source=filesystem position=left toggle=true reveal=true<cr>')
  --   end
  -- },
  -- }}}

  -- {{{ FERN
  --     https://github.com/lambdalisue/fern.vim
  --     https://github.com/lambdalisue/fern-hijack.vim
  --     https://github.com/lambdalisue/fern-git-status.vim
  --     https://github.com/lambdalisue/fern-mapping-project-top.vim
  {
    'lambdalisue/fern.vim',
    dependencies = {
      { 'lambdalisue/fern-hijack.vim' },
      { 'lambdalisue/fern-git-status.vim' },
      { "TheLeoP/fern-renderer-web-devicons.nvim" },
      { "lambdalisue/fern-mapping-project-top.vim" },
      -- { 'LumaKernel/fern-mapping-reload-all.vim' },
      -- { 'yuki-yano/fern-preview.vim' },
      -- { 'yuki-yano/fern-renderer-web-devicons.nvim' },
      -- { 'lambdalisue/glyph-palette.vim' },
    },
    lazy = true,
    cmd = { 'Fern' },
    config = function()
      vim.g['fern#renderer'] = 'nvim-web-devicons'

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('fern-startup', {}),
        pattern = { 'fern' },
        callback = function()
          local km = function(m, k, c)
            vim.keymap.set(m, k, c, { silent = true, buffer = true, noremap = true })
          end
          km('n', 'p', '<Plug>(fern-action-project-top:reveal)')
        end
      })
    end,
    keys = {
      { "<leader>e", "<cmd>Fern . -reveal=%:p<CR>", "n", desc = "Show Fern" },
    }
  },
  {
    'lambdalisue/fern-hijack.vim',
    dependencies = {
      'lambdalisue/fern.vim',
      cmd = 'Fern',
    },
  },
  -- }}}

  -- {{{ CHAT-GPT
  --     https://github.com/jackMort/ChatGPT.nvim
  {
    "jackMort/ChatGPT.nvim",
    lazy = true,
    cmd = "ChatGPT",
    opts = {
      api_key_cmd = "op read op://Personal/openai.com/terminal -n",
      popup_input = {
        submit = "<C-m>",
      },
    },
    keys = {
      { "<leader>cc", "<cmd>ChatGPT<CR>",                    { "n" },      desc = "Chat" },
      { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", { "n", "v" }, desc = "Edit with instructions" },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  -- }}}

  -- {{{ LSP & COMPLETION
  --     https://github.com/VonHeikemen/lsp-zero.nvim
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'VonHeikemen/lsp-zero.nvim' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp" },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        })
      })
    end
  },

  -- LSP
  { "folke/neodev.nvim", opts = {} },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { "folke/neodev.nvim" },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'VonHeikemen/lsp-zero.nvim' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      -- LUA
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)

      -- ELIXIR / LEXICAL
      -- https://github.com/lexical-lsp/lexical
      if not configs.lexical then
        configs.lexical = {
          default_config = {
            filetypes = { "elixir", "eelixir" },
            cmd = { "/Users/box/Code/tools/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
            root_dir = function(fname)
              return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
            end,

          }
        }
      end
      lspconfig.lexical.setup({})
    end
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua"
    },
    opts = {},
  },
  -- }}}

})
-- }}}

-- {{{ Configure Options
--     See `:help vim.o`

-- Automatically change directory to current file
vim.o.autochdir = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Save most options to the session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Don't wrap lines
vim.wo.wrap = false

-- Default indentation
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
-- }}}

-- {{{ Basic Keymaps
--     See `:help vim.keymap.set()`

-- Add sane indentiation commands
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- easily close a buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "[Q]uit Buffer" })

-- emulate some readline keybinds in command mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-f>', '<Right>')

-- }}}
-- vim: foldmethod=marker ts=2 sts=2 sw=2 et
