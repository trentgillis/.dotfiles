local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.solargraph.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern('Gemfile', '.git', '.'),
  settings = {
    solargraph = {
      useBundler = true,
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  },
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
  cmd = { 'typescript-language-server', '--stdio' }
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true)
        }
      }
    }
  }
}
