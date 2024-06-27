return {
  -- {
  --   'smoka7/hop.nvim',
  --   version = '*',
  --   opts = {
  --     keys = 'etovxqpdygfblzhckisuran',
  --   },
  --   config = function()
  --     local hop = require 'hop'
  --     hop.setup()
  --     local directions = require('hop.hint').HintDirection
  --     vim.keymap.set('', 'f', function()
  --       hop.hint_words { direction = directions.AFTER_CURSOR }
  --     end, { remap = true })
  --     vim.keymap.set('', 'F', function()
  --       hop.hint_words { direction = directions.BEFORE_CURSOR }
  --     end, { remap = true })
  --   end,
  -- },
  -- Leap
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()
    end,
  },
}
