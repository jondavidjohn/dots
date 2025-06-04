return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    enabled = false,
    config = function ()
      ---@diagnostic disable-next-line: missing-fields
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "gitignore", "git_config", "git_rebase", "gitcommit",
          "css", "html",
          "dockerfile",
          "go", "ruby", "lua", "sql",
          "vim", "vimdoc", "tmux",
          "markdown", "markdown_inline", "json", "yaml",
        },

        sync_install = false,
        auto_install = true,
        highlight = { enable = false },
        indent = { enable = true },
      }
    end
  }
}
