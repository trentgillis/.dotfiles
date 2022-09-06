local keymap = vim.keymap.set

-- Fast Exit Insert Mode
keymap('i', 'jk', '<ESC>')

-- Do not yank with x
keymap('n', 'x', '"_x')

-- New tab
keymap('n', 'te', ':tabedit<Return>', { silent = true })

-- New window
keymap('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Window navigation
keymap('', '<C-h>', '<C-w>h')
keymap('', '<C-j>', '<C-w>j')
keymap('', '<C-k>', '<C-w>k')
keymap('', '<C-l>', '<C-w>l')

-- Buffer Navigation
keymap('n', 'gn', ':bn<cr>')
keymap('n', 'gp', ':bp<cr>')
