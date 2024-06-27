return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-jest',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local neotest = require 'neotest'

    neotest.setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        -- require 'neotest-plenary',
        -- require 'neotest-vim-test' {
        --   ignore_file_types = { 'python', 'vim', 'lua' },
        -- },
      },
    }

    vim.keymap.set('n', '<leader>mr', function()
      neotest.run.run()
    end, { desc = 'run test' })
    vim.keymap.set('n', '<leader>ms', function()
      neotest.run.stop()
    end, { desc = 'stop test' })
    vim.keymap.set('n', '<leader>mo', function()
      neotest.output.open()
    end, { desc = 'open output' })
    vim.keymap.set('n', '<leader>mO', function()
      neotest.output.open { enter = true }
    end, { desc = 'open output(enter=true)' })
    vim.keymap.set('n', '<leader>mi', function()
      neotest.summary.toggle()
    end, { desc = 'toggle summary' })
    vim.keymap.set('n', '<leader>mf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'run current file' })
    vim.keymap.set('n', '[n', function()
      neotest.jump.prev { status = 'failed' }
    end, { desc = 'jump to prev failed' })
    vim.keymap.set('n', ']n', function()
      neotest.jump.next { status = 'failed' }
    end, { desc = 'jump to next failed' })
  end,
}
