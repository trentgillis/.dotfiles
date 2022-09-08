local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  ensure_installed = {
    'lua',
    'ruby',
    'tsx',
    'typescript',
    'javascript',
    'json',
    'css',
    'markdown',
    'html',
    'jsdoc',
    'embedded_template',
  },
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  autotag = {
    enable = true
  }
}
