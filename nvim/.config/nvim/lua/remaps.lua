local keymap = vim.keymap

-- Fast Exit Insert Mode
keymap.set('i', 'jk', '<ESC>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- New window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Window navigation
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')

-- Fast netrw
keymap.set('n', 'fd', ':Ex<Return>')
