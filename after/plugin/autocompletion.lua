local cmp = require("cmp")
local luasnip = require("luasnip")

vim.opt.pumheight = 4;
vim.o.completeopt = "menuone,noselect"
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },      -- LSP completions
    { name = "luasnip" },       -- Snippet completions
    { name = "path" },          -- File paton 
    { name = "tags" },          -- Tags (if ctags or similar is used)
    { name = "git" },           -- Git completions (like branches, commits)
  }, {
    { name = "buffer" },        -- Buffer completions (current buffer)
  }),
  window = {
      -- this doesn't work but idk what would happend if i removed it ... 
    completion = {
      max_height = 5,   -- Set the max number of items in the completion menu
      max_width = 50,   -- Limit width of the menu
      max_item_count = 5;
      
    },
    documentation = cmp.config.window.bordered(),
  },
})

