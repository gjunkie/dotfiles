--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end
--
-- protocol.CompletionItemKind = {
--   '', -- Text
--   'µ', -- Method
--   'ƒ', -- Function
--   '©', -- Constructor
--   '', -- Field
--   '', -- Variable
--   '', -- Class
--   '¡', -- Interface
--   '', -- Module
--   '', -- Property
--   '', -- Unit
--   '√', -- Value
--   '', -- Enum
--   '', -- Keyword
--   '≠', -- Snippet
--   '', -- Color
--   '', -- File
--   '®', -- Reference
--   '', -- Folder
--   '', -- EnumMember
--   '', -- Constant
--   '', -- Struct
--   '', -- Event
--   'ﬦ', -- Operator
--   '', -- TypeParameter
-- }

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function organize_imports()
  local params = {
    command = "_typescript.removeUnusedImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

nvim_lsp.tsserver.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

nvim_lsp.lua_ls.setup {
  filetypes = { "lua" },
  cmd = { "lua-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.sourcekit.setup {
  capabilities = capabilities,
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.jdtls.setup {
  capabilities = capabilities,
  cmd = { "~/code/servers/launch_jdtls.sh" },
  filetypes = { "java" },
}

nvim_lsp.cssls.setup {
  capabilities = capabilities
}

nvim_lsp.astro.setup {
  capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  }
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "", Warn = "", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
