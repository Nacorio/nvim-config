--------------------- KEYBINDS -------------------------
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local map = vim.keymap.set

------------ hide search highlight on escape ----------
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

------------ clipboard ----------
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')

------------ move lines ----------
map('n', '<C-S-J>', ':m +1<CR>')
map('n', '<C-S-K>', ':m -2<CR>')

------------ movement in insert mode ----------
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

------------ terminal ----------
map('n', '<leader>s', '<cmd>terminal<CR>')

------------ files ----------
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>ff', telescope_builtin.find_files)
map('n', '<leader>fp', '<cmd>e ~/.config/nvim/')
map('n', '<leader>.', '<cmd>e .<CR>')

------------ buffers ----------
map('n', '<leader>bp', '<cmd>bp<CR>')
map('n', '<leader>bn', '<cmd>bn<CR>')
map('n', '<leader>bd', '<cmd>bd<CR>')
map('n', '<leader>bf', telescope_builtin.buffers)
map('n', '<leader>by', ':%y+<CR>')

------------ code actions ----------
map('n', '<leader>cf', vim.lsp.buf.format, { desc = 'format'})
-- map('n', '<leader>cr', function()
--     for i, _ in pairs(vim.lsp.client) do
--         vim.lsp.stop_client(i)
--     end
-- end)
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'open diagnostic float'})
map('n', '<leader>a', '<cmd>Lspsaga code_action<CR>', {desc = 'code action'})
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', {desc = 'code action'})
map('n', '<leader>cr', '<cmd>Lspsaga rename<CR>', {desc = 'rename'})
map('n', '<leader>cd', 'gd', {desc = 'go to definition'})

CompileCommand = ""
map('n', '<leader>cc', function ()
    CompileCommand = vim.fn.input("compile command: ", CompileCommand)
    vim.cmd(':!' .. CompileCommand);
end, {desc = 'compile'})
map('n', '<leader>cC', function ()
    vim.cmd(':!' .. CompileCommand);
end, {desc = 'compile with same command'})

------------ dapui ----------
map('n', '<leader>tt', ':lua require(\'dapui\').toggle()<CR>', { desc = 'toggle DAP ui'})
map('n', '<leader>tb', '<cmd>DapToggleBreakpoint<CR>')
map('n', '<leader>tc', '<cmd>DapClearBreakpoints<CR>')

------------ help ----------
map('n', '<leader>hk', '<cmd>WhichKey<CR>')
map('n', '<leader>hr', ':so ~/.config/nvim/init.lua<CR>', { desc = 'reload config'})
map('n', '<leader>hs', ':so<CR>', { desc = 'source current file'})
