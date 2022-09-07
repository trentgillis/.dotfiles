local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- We want to return true for any case where auto formatting should occur.
      -- In this case we want to format through null-ls as well as solargraph
      if client.name == 'null-ls' then
        return true
      end

      if client.name == 'solargraph' then
        return true
      end

      if client.name == 'sumneko_lua' then
        return true
      end
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
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
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdPart = false
        }
      }
    }
  }
}
