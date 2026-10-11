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

o.autochdir = true

--------------------- KEYBINDS -------------------------
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local map = vim.keymap.set

-- map('n', '<C-c>', ':!')

map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('n', '<C-S-J>', ':m +1<CR>')
map('n', '<C-S-K>', ':m -2<CR>')

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

map('n', '<leader>s', '<cmd>terminal<CR>')

map('n', '<leader>e', '<cmd>e .<CR>') -- file explorer

map('n', '<C-p>', '<cmd>bp<CR>')
map('n', '<C-n>', '<cmd>bn<CR>')

map('n', '<leader>bp', '<cmd>bp<CR>')
map('n', '<leader>bn', '<cmd>bn<CR>')
map('n', '<leader>bd', '<cmd>bd<CR>')

-- lsp keybinds
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>lr', function()
    for i, _ in pairs(vim.lsp.client) do
        vim.lsp.stop_client(i)
    end
end)
map('n', '<leader>d', vim.diagnostic.open_float)
map('n', '<leader>a', '<cmd>Lspsaga code_action<CR>')

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
    { src = 'https://github.com/mfussenegger/nvim-dap.git' },
    { src = 'https://github.com/nvim-neotest/nvim-nio.git' },
    { src = 'https://github.com/rcarriga/nvim-dap-ui.git' },
    { src = 'https://github.com/folke/lazydev.nvim.git' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim.git' },
    { src = 'https://github.com/akinsho/bufferline.nvim.git' },
    { src = 'https://github.com/nvim-mini/mini.nvim.git' },
    { src = 'https://github.com/nvimdev/lspsaga.nvim.git' },
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim.git' },
})

require('tokyonight').setup({})
vim.cmd [[colorscheme tokyonight-night]]

require('which-key').setup({})

require('nvim-treesitter').install({ 'rust', 'c', 'lua' })

require('nvim-autopairs').setup({})

require('blink.cmp').setup({
    keymap = { preset = 'super-tab' },
})

require('gitsigns').setup({})

require('lazydev').setup({
    library = { "nvim-dap-ui" },
})

require('dapui').setup()

require("lualine").setup({
    options = {
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
    }
})

require("bufferline").setup()

require('lspsaga').setup({
    code_action = {
        keys = {
            quit = { 'q', '<Esc>' }
        }
    }
})

require('ibl').setup({
    scope = { highlight = "MiniTablineHidden" },
})

--------------------- mini.nvim -------------------------
require('mini.surround').setup()

--------------------- LSP -------------------------
vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config { virtual_text = true }

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable('rust_analyzer')

--------------------- DAP -------------------------
local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/usr/share/cpptools-debug/bin/OpenDebugAD7',
}
dap.configurations.c = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            local s = vim.fn.input('Arguments: ')
            local vec = {}
            local index = 1
            for part in string.gmatch(s, "%S+") do
                vec[index] = part
                index = index + 1
            end
            return vec
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}
dap.configurations.rust = dap.configurations.c
