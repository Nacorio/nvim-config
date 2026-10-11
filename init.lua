local vim = vim
--------------------- OPTIONS -------------------------
local o = vim.opt

o.number = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.swapfile = false
o.winborder = "rounded"
o.colorcolumn = { 100 }

o.mouse = 'a'
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.signcolumn = "yes"

o.list = true
o.listchars = { tab = '» ', trail = '·' }

o.termguicolors = true

vim.g.mapleader = ' '
vim.g.localmapleader = ' '

--------------------- KEYBINDS -------------------------
local map = vim.keymap.set

map('n', '<C-c>', ':!')

map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('n', '<C-S-J>', ':m +1<CR>')
map('n', '<C-S-K>', ':m -2<CR>')

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- lsp keybinds
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>d', vim.diagnostic.open_float)

-- dapui
map('n', '<leader>tt', ':lua require(\'dapui\').toggle()<CR>')
map('n', '<leader>tb', '<cmd>DapToggleBreakpoint<CR>')
map('n', '<leader>tc', '<cmd>DapClearBreakpoints<CR>')

map('n', '<leader>h', '<cmd>WhichKey<CR>')

--------------------- PLUGINS -------------------------
vim.pack.add({
    { src = 'https://github.com/folke/tokyonight.nvim.git' },
    { src = 'https://github.com/folke/which-key.nvim.git' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter.git', lazy = false },
    { src = 'https://github.com/neovim/nvim-lspconfig.git' },
    { src = 'https://github.com/windwp/nvim-autopairs.git' },
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp.git' },
    { src = "https://github.com/lewis6991/gitsigns.nvim.git" },
})

require('tokyonight').setup({})
vim.cmd [[colorscheme tokyonight-night]]

require('which-key').setup({})

require('nvim-treesitter').install({'rust', 'c', 'lua'})

require('nvim-autopairs').setup({})

require('blink.cmp').setup({
    keymap = { preset = 'super-tab' },
})

require('gitsigns').setup({})

--------------------- LSP -------------------------
vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config { virtual_text = true }

vim.lsp.enable("lua_ls")
vim.lsp.enable("clang")
