local lspsaga = require("lspsaga")
local rust_tools = require("rust-tools")
local null_ls = require("null-ls")
local lsp_config = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- lsp's: angularls, cssls, pyright, tsserver, html, sumneko_lua, tailwindcss

-- lsp-config
lsp_config.rust_analyzer.setup({ capabilities = capabilities })
lsp_config.cssls.setup({ capabilities = capabilities })
lsp_config.pyright.setup({ capabilities = capabilities })
lsp_config.tailwindcss.setup({ capabilities = capabilities })
lsp_config.gopls.setup({ capabilities = capabilities })
lsp_config.theme_check.setup({
  capabilities = capabilities
})

local no_formatting_capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
no_formatting_capabilities.textDocument.formatting = false
no_formatting_capabilities.textDocument.range_formatting = false

local no_formatting_on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.document_range_formatting = false
end

lsp_config.tsserver.setup({
  on_attach = no_formatting_on_attach,
  capabilities = no_formatting_capabilities,
})
lsp_config.html.setup({
  on_attach = no_formatting_on_attach,
  capabilities = no_formatting_capabilities,
})

local sumneko_runtime_paths = vim.split(package.path, ";")
table.insert(sumneko_runtime_paths, "lua/?.lua")
table.insert(sumneko_runtime_paths, "lua/?/init.lua")
lsp_config.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = sumneko_runtime_paths,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = no_formatting_capabilities,
  on_attach = no_formatting_on_attach,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})

-- Lspsaga
lspsaga.init_lsp_saga()

-- Null-ls
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    -- Prettier
    null_ls.builtins.formatting.prettierd,
    -- Stylua
    null_ls.builtins.formatting.stylua,
    -- eslint_d
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.eslint_d,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_seq_sync(nil, 5000, { "null-ls" })
        end,
      })
    end
  end,
  root_dir = lsp_config.util.root_pattern("package.json", ".null-ls-root", "Makefile", ".git"),
})

-- rust_tools
rust_tools.setup({})
