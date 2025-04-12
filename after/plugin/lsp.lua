require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",          -- C/C++
        "gopls",           -- Go
        "html",            -- HTML
        "cssls",           -- CSS
        "ts_ls",        -- JS/TS
        "intelephense",    -- PHP
        "rust_analyzer",   -- Rust
        "bashls",          -- Bash
        "sqlls",           -- SQL
        "marksman",        -- Markdown
        "lua_ls"           -- Lua
    }
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers {
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    })
  end
}


