return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_c = { require('auto-session.lib').current_session_name },
      },
    }
  end,
}
