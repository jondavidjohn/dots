return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function ()
      local caps = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config('lua_ls', { capabilities = caps })
      vim.lsp.config('solargraph', { capabilities = caps })
      vim.lsp.config('gopls', { capabilities = caps })
      vim.lsp.config('yamlls', { capabilities = caps })

      vim.lsp.config('sorbet', {
        cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
        filetypes = { "ruby" },
        capabilities = caps,
        root_markers = { "sorbet/config" },
      })

      vim.lsp.config('rubocop', {
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        filetypes = { "ruby" },
        capabilities = caps,
      })

      vim.lsp.enable({ 'lua_ls', 'solargraph', 'gopls', 'yamlls', 'sorbet', 'rubocop' })
    end
  }
}
