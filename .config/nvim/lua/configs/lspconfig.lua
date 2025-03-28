-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"
-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig.ts_ls.setup {
  -- on_attach = nvlsp.on_attach,
  -- on_init = nvlsp.on_init,
  -- capabilities = nvlsp.capabilities,
-- }

-- lspconfig.rust_analyzer.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     cargo = {
--       allfeatures = true,
--     }
--   }
-- }
