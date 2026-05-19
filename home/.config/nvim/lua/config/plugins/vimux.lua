return {
  'preservim/vimux',
  config = function()
    vim.g.VimuxHeight = '35%'
    vim.keymap.set('n', '<leader>tz', ':VimuxZoomRunner<CR>')
    vim.keymap.set('n', '<leader>tq', ':VimuxCloseRunner<CR>')
  end,
}
