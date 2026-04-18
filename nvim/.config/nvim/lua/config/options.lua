-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { "cwd" }

-- Fix treesitter "Invalid 'end_col': out of range" error.
-- Certain parsers (svelte, tsx, markdown_inline) return an end_col past the
-- actual line length. Clamp it before it hits the C API. The namespace check
-- keeps this from touching gitsigns/diagnostics/other extmark callers.
do
  local orig = vim.api.nvim_buf_set_extmark
  local ts_ns -- lazily cached once treesitter creates its namespace
  vim.api.nvim_buf_set_extmark = function(buf, ns, line, col, opts)
    if ts_ns == nil then
      ts_ns = vim.api.nvim_get_namespaces()["nvim.treesitter.highlighter"]
    end
    if ns == ts_ns and opts and opts.end_col ~= nil then
      local end_line = opts.end_line or line
      local lines = vim.api.nvim_buf_get_lines(buf, end_line, end_line + 1, false)
      if lines[1] and opts.end_col > #lines[1] then
        opts.end_col = #lines[1]
      end
    end
    return orig(buf, ns, line, col, opts)
  end
end
