local autocmd = vim.api.nvim_create_autocmd

vim.opt.guifont = { "JetBrainsMono Nerd Font", "h12" }
local enable_providers = {
    "python3_provider",
    "node_provider",
    -- and so on
  }

  for _, plugin in pairs(enable_providers) do
    vim.g["loaded_" .. plugin] = nil
    vim.cmd("runtime " .. plugin)
  end
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/nvim/lua/custom/snippets/snippets.lua"

-- Noice
vim.api.nvim_set_keymap("n", "<leader>nd", ":NoiceDismiss<CR>", {noremap=true})

vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
  {silent = true, noremap = true}
)




vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})