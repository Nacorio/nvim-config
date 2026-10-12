
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true })
vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		vim.cmd.RustLsp({ "hover", "actions" })
	end,
	{ silent = true, buffer = bufnr }
)

local map = vim.keymap.set

-- cargo keybinds
map('n', '<leader>cr', ':w<CR>:!cargo run<CR>')
map('n', '<leader>cb', ':w<CR>:!cargo build<CR>')
map('n', '<leader>ct', ':w<CR>:!cargo test<CR>')
map('n', '<leader>cf', ':w<CR>:!cargo run --release<CR>')
map('n', '<leader>cg', ':w<CR>:!cargo build --release<CR>')
map('n', '<leader>ca', ':!cargo add')
