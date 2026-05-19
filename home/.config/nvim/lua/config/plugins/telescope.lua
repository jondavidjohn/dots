return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function ()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
          },
        },
      },
      extensions = {
        fzf = {}
      },
    })

    require('telescope').load_extension('fzf')

    local opts = {
      file_ignore_patterns = { 'sorbet/' }
    }

    vim.keymap.set('n', '<leader>kk', function ()
      require('telescope.builtin').find_files(opts)
    end)

    vim.keymap.set('n', '<leader>ks', function ()
      require('telescope.builtin').live_grep(opts)
    end)

    vim.keymap.set('n', '<leader>kr', function()
      require('telescope.builtin').lsp_references()
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>kb', function()
      require('telescope.builtin').buffers()
    end, { noremap = true, silent = true })

    vim.keymap.set('n', '<leader>kg', require("telescope.builtin").git_files)
    vim.keymap.set('n', '<leader>km', require("telescope.builtin").treesitter)
    vim.keymap.set('n', '<leader>kh', require("telescope.builtin").help_tags)
    vim.keymap.set('n', '<leader>ka', require("telescope.builtin").find_files)
    vim.keymap.set('n', '<leader>kn', function ()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('config')
      }
    end)
  end
}
