return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    ---@diagnostic disable-next-line: missing-parameter
    harpoon:setup {
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
      },
    }

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    local bindSelect = function(n)
      vim.keymap.set('n', '<leader>' .. n, function()
        harpoon:list():select(n)
      end, { desc = 'Harpoon to file' .. n })
    end

    vim.keymap.set('n', '<leader>h', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<leader>p', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon previous buffer' })

    vim.keymap.set('n', '<leader>n', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next buffer' })

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end, { desc = 'Harpoon file' })

    bindSelect(1)
    bindSelect(2)
    bindSelect(3)
    bindSelect(4)
    bindSelect(5)
    bindSelect(6)
  end,
}
