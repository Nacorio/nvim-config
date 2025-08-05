-- options
local o = vim.opt

o.number = true
o.relativenumber = true
o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.swapfile = false
o.winborder = "rounded"
o.clipboard = "unnamedplus"

o.mouse = 'a'
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 250

o.list = true

-- keybinds
vim.g.mapleader = " "
vim.g.localmapleader = " "

local map = vim.keymap.set

map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<C-c>', ':!')

map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- cargo keybinds
map('n', '<leader>cr', ':w<CR>:!cargo run<CR>')
map('n', '<leader>cb', ':w<CR>:!cargo build<CR>')
map('n', '<leader>ct', ':w<CR>:!cargo test<CR>')
map('n', '<leader>cf', ':w<CR>:!cargo run --release<CR>')
map('n', '<leader>cg', ':w<CR>:!cargo build --release<CR>')

map('n', '<leader>f', ':lua MiniFiles.open()<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		vim.cmd.RustLsp({ "hover", "actions" })
	end,
	{ silent = true, buffer = bufnr }
)

-- plugins
vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim.git" },
	{ src = "https://github.com/echasnovski/mini.nvim.git" },
	{ src = "https://github.com/Saghen/blink.cmp.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git", branch = 'master' },
	{ src = "https://github.com/lewis6991/gitsigns.nvim.git" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua.git" },
	{ src = "https://github.com/mrcjkb/rustaceanvim.git" },
	{ src = "https://github.com/mfussenegger/nvim-dap.git" },
})

require("tokyonight").setup({})
vim.cmd[[colorscheme tokyonight-night]]

require("blink.cmp").setup({
	keymap = {preset = 'super-tab'},
	fuzzy = {implementation = "lua"},
})

require 'nvim-treesitter.configs'.setup {
	ensure_installed = {"c", "lua", "rust"},
	highlight = {
		enable = true,
	},
}

require('gitsigns').setup({})

require('colorizer').setup({ 
	'lua';
	'css';
	'rust';
})

-- mini modules
-- text editing
require("mini.pairs").setup({})
require("mini.surround").setup({})

-- general workflow
require("mini.files").setup({
	mappings = {
		close = '<Esc>',
	},
})

-- appearance
require("mini.icons").setup({})
require("mini.statusline").setup({})
require("mini.comment").setup({})

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config { virtual_text = true }
