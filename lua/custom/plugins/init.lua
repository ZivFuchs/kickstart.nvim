-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--

vim.opt.termguicolors = true -- required by noice and bufferline.nvim

return {
  {
    'EdenEast/nightfox.nvim',
    config = function()
      vim.cmd 'colorscheme nightfox'
    end,
  },
  { -- notification popups
    'rcarriga/nvim-notify',
    config = function()
      vim.opt.termguicolors = true
      vim.notify = require 'notify'
    end,
  },
  { -- command popups
    'folke/noice.nvim',
    opts = {},
    dependencies = {
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
  {
    'hrsh7th/cmp-path',
    config = function()
      sources = {
        { name = 'path' },
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
  },
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup {
        enabled = true,
      }
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<Leader>nf', ":lua require('neogen').generate()<CR>", opts)
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   opts = {
  --     offsets = {
  --       {
  --         filetype = 'neo-tree',
  --         text = 'NeoTree',
  --         highlight = 'directory',
  --         text_align = 'left',
  --       },
  --     },
  --   },
  --   config = function()
  --     require('bufferline').setup {}
  --   end,
  -- },
}
