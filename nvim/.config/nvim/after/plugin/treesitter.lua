local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.erb = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  filetype = "erb",
}

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
    'erb',
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
