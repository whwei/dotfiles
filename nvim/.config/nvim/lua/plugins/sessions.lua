return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      pre_save_cmds = { 'Neotree close' },
      save_extra_cmds = {
        'Neotree filesystem show',
      },
      post_restore_cmds = {
        'Neotree filesystem show',
      },
    }
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
  end,
}
