--  Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local keymap = vim.keymap.set
local keymap_opts = { silent = true }

local plugins

if vim.g.vscode == 1 then
  plugins = {
    {
      -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      branch = 'master',
      lazy = false,
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end,
    },
    {
      'tpope/vim-sensible'
    },
    {
      'rhysd/clever-f.vim'
    },
    {
      'hashivim/vim-terraform'
    },
    {
      'ggandor/leap.nvim',
      config = function(_, opts)
        local leap = require("leap")
        leap.add_default_mappings(true)
      end,
    }
  }
else
  plugins = {
    -- note: this is where your plugins related to lsp can be installed.
    --  the configuration is done below. search for lspconfig to find it below.
    {
      -- lsp configuration & plugins
      'neovim/nvim-lspconfig',
      dependencies = {
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
      },
    },

    {
      -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        {
          "L3MON4D3/LuaSnip",
          -- follow latest release.
          version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
          -- install jsregexp (optional!).
          build = "make install_jsregexp",
        },
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
      },
    },

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },

    {
      -- Adds git related signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      opts = {
        -- See `:help gitsigns.txt`
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
            { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
          vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
            { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
          vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
            { buffer = bufnr, desc = '[P]review [H]unk' })
        end,
      },
    },
    {
      -- Theme inspired by Atom
      'navarasu/onedark.nvim',
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'onedark'
      end,
    },
    {
      -- Set lualine as statusline
      'nvim-lualine/lualine.nvim',
      -- See `:help lualine.txt`
      opts = {
        options = {
          icons_enabled = false,
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        },
      },
    },

    {
      -- Add indentation guides even on blank lines
      'lukas-reineke/indent-blankline.nvim',
      -- Enable `lukas-reineke/indent-blankline.nvim`
      -- See `:help indent_blankline.txt`
      main = "ibl",
      opts = {},
      -- opts = {
      --     char = '┊',
      --     show_trailing_blankline_indent = false,
      -- },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          -- NOTE: If you are having trouble with this installation,
          --       refer to the README for telescope-fzf-native for more instructions.
          build = 'make',
          cond = function()
            return vim.fn.executable 'make' == 1
          end,
        },
      },
    },

    {
      -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ':TSUpdate',
    },
  }
end

if vim.g.is_mac == true then
  local macos_plugins = {
    {
      'folke/tokyonight.nvim',
      config = function()
        vim.cmd('colorscheme tokyonight')
      end
    },
    {
      "keaising/im-select.nvim",
      config = function()
        require("im_select").setup({
          default_im_select       = "com.apple.keylayout.ABC",

          default_command         = "/opt/homebrew/bin/macism",

          -- Restore the default input method state when the following events are triggered
          set_default_events      = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

          -- Restore the previous used input method state when the following events
          -- are triggered, if you don't want to restore previous used im in Insert mode,
          -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
          -- as `set_previous_events = {}`
          set_previous_events     = { "InsertEnter" },

          -- Show notification about how to install executable binary when binary missed
          keep_quiet_on_no_binary = false,

          -- Async run `default_command` to switch IM or not
          async_switch_im         = true,
        })
      end,
    },
  }
end

require('lazy').setup(plugins, {})
