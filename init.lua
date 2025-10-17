local vim = vim -- this is not good
-- options
local o = vim.opt

o.number = true
o.relativenumber = true
-- o.wrap = false
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

-- keybinds
vim.g.mapleader = " "
vim.g.localmapleader = " "

local map = vim.keymap.set

--map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<C-c>', ':!')

map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('n', '<C-S-J>', ':m +1<CR>')
map('n', '<C-S-K>', ':m -2<CR>')

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- bufferline keybinds
map('n', '<leader>bp', '<cmd>BufferLineCyclePrev<CR>')
map('n', '<C-P>', '<cmd>BufferLineCyclePrev<CR>')
map('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>')
map('n', '<C-N>', '<cmd>BufferLineCycleNext<CR>')
map('n', '<leader>bq', '<cmd>BufferLineCloseRight<CR>')
map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>')

-- Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

map('i', '<C-BS>', '<Esc>ldbi')
map('i', '<C-Del>', '<Esc>ldwi')

-- cargo keybinds
map('n', '<leader>cr', ':w<CR>:!cargo run<CR>')
map('n', '<leader>cb', ':w<CR>:!cargo build<CR>')
map('n', '<leader>ct', ':w<CR>:!cargo test<CR>')
map('n', '<leader>cf', ':w<CR>:!cargo run --release<CR>')
map('n', '<leader>cg', ':w<CR>:!cargo build --release<CR>')
map('n', '<leader>ca', ':!cargo add')

-- typst keybinds
map('n', '<leader>t', ':TypstPreview<CR>')

map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>d', vim.diagnostic.open_float)

-- plugins
vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim.git" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim.git" },
	{ src = "https://github.com/echasnovski/mini.nvim.git" },
	{ src = "https://github.com/Saghen/blink.cmp.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git",    branch = 'master' },
	{ src = "https://github.com/lewis6991/gitsigns.nvim.git" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua.git" },
	{ src = "https://github.com/mrcjkb/rustaceanvim.git" },
	{ src = "https://github.com/mfussenegger/nvim-dap.git" },
	{ src = "https://github.com/folke/trouble.nvim.git" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim.git" },
	{ src = "https://github.com/akinsho/bufferline.nvim.git" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim.git" },
	{ src = "https://github.com/ray-x/web-tools.nvim.git" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim.git" },
	{ src = "https://github.com/windwp/nvim-autopairs.git" },
	{ src = "https://github.com/NMAC427/guess-indent.nvim.git" },
	{ src = "https://github.com/seblyng/roslyn.nvim.git" },
})

-- require("tokyonight").setup({})
-- vim.cmd [[colorscheme tokyonight-night]]
require("gruvbox").setup({})
vim.cmd [[colorscheme gruvbox]]

require("blink.cmp").setup({
	keymap = { preset = 'super-tab' },
	fuzzy = { implementation = "lua" },
})

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "rust", "typst", "html", "wgsl", "cpp", "c_sharp" },
	highlight = {
		enable = true,
	},
}

require('gitsigns').setup({})

require('colorizer').setup({
	'lua',
	'css',
	'rust',
	'conf',
	'typst',
	'html',
	'wgsl',
})

-- mini modules
-- text editing
-- require("mini.pairs").setup({
-- 	mappings = {
-- 		['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
-- 		['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
-- 		['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
--
-- 		[')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
-- 		[']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
-- 		['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
--
-- 		['"'] = { action = 'close', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
-- 		["'"] = { action = 'close', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
-- 		['`'] = { action = 'close', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
-- 	},
-- })
require("mini.surround").setup({})

-- general workflow
map('n', '<leader>fp', ':lua MiniFiles.open()<CR>')
require("mini.files").setup({
	mappings = {
		close = '<Esc>',
	},
})

-- appearance
require("mini.icons").setup({})
require("mini.statusline").setup({})
require("mini.comment").setup({})

-- show diagnostics at the bottom
require("trouble").setup({})
map('n', '<leader>o', '<cmd>Trouble diagnostics toggle<CR>')

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config { virtual_text = true }

require("bufferline").setup({})

require("telescope").setup({})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require("ibl").setup({
	scope = { highlight = "MiniTablineHidden" },
})

vim.lsp.config("wgsl-analyzer", {
	cmd = { "wgsl-analyzer" },
	filetypes = { "wgsl" },
})
vim.lsp.enable("wgsl-analyzer")

require("nvim-autopairs").setup()

require("Arduino-Nvim.lsp").setup()

require("guess-indent").setup {
	override_editorconfig = false
}

vim.lsp.config("roslyn", {})
vim.lsp.enable("roslyn")

vim.lsp.enable("clangd")
