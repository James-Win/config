-- Define the M variable to store keybindings
local M = {}

-- Setting UltiSnips triggers using Lua in Neovim
vim.api.nvim_set_var('UltiSnipsExpandTrigger', '<tab>')
vim.api.nvim_set_var('UltiSnipsJumpForwardTrigger', '<tab>')
vim.api.nvim_set_var('UltiSnipsJumpBackwardTrigger', '<c-z>')


-- more keybinds!

-- Return the M table at the end of the file
return M
