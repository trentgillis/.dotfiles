local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

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
  extensions = {}
}

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
