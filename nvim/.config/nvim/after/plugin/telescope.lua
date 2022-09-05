local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['<C-q>'] = actions.close
      },
      i = {
        ['<C-q>'] = actions.close
      }
    }
  },
  pickers = {
    buffers = {
      initial_mode = 'normal'
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function() vim.cmd('startinsert') end
        },
      }
    }
  }
}

telescope.load_extension 'file_browser'

local keymap = vim.keymap
keymap.set('n', '<leader>f', function()
  builtin.find_files({ no_ignore = false, hidden = true })
end)
keymap.set('n', '<leader>fg', function()
  builtin.live_grep()
end)
keymap.set('n', '<leader>fb', function()
  builtin.buffers()
end)
keymap.set('n', 'fd', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 }
  })
end)
