local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {}

local opts = { silent = true }
local keymap = vim.keymap.set
keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
keymap('v', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
keymap('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
