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
        root_dir = function(bufnr, on_dir)
          local root = vim.fs.root(bufnr, "sorbet/config")
          if root then
            on_dir(root)
          end
        end,
      })

      vim.lsp.config('rubocop', {
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        filetypes = { "ruby" },
        capabilities = caps,
        root_dir = function(bufnr, on_dir)
          local root = vim.fs.root(bufnr, { ".git", "Gemfile" })
          if not root then
            return
          end

          if vim.uv.fs_stat(root .. "/.rubocop.yml") then
            on_dir(root)
            return
          end

          local lockfile = root .. "/Gemfile.lock"
          if vim.uv.fs_stat(lockfile) then
            local contents = table.concat(vim.fn.readfile(lockfile), "\n")
            if contents:match("\n    rubocop %(") then
              on_dir(root)
            end
          end
        end,
      })

      vim.lsp.enable({ 'lua_ls', 'solargraph', 'gopls', 'yamlls', 'sorbet', 'rubocop' })
    end
  }
}
