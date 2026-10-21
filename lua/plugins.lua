--------------------- PLUGIN INSTALLATION -------------------------
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
    { src = 'https://github.com/nvim-lua/plenary.nvim.git' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim.git' },
    { src = 'https://github.com/ahmedkhalf/project.nvim.git' },
})

--------------------- PLUGIN SETTINGS -------------------------
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

-- telescope
require('telescope').setup({})

-- project_nvim
require('project_nvim').setup({})
require('telescope').load_extension('projects')
