vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.inccommand = 'split'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.api.nvim_command('filetype indent off')

vim.g.mapleader = ' '
