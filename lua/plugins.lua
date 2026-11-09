-------------------- PLUGIN INSTALLATION -------------------------
vim.pack.add({
    { src = 'https://github.com/folke/tokyonight.nvim.git' },
    { src = 'https://github.com/folke/which-key.nvim.git' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter.git',      lazy = false },
    { src = 'https://github.com/neovim/nvim-lspconfig.git' },
    { src = 'https://github.com/windwp/nvim-autopairs.git' },
    { src = 'https://github.com/saghen/blink.cmp.git',                     version = vim.version.range("1.*") },
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
    { src = 'https://github.com/MeanderingProgrammjr/render-markdown.nvim' },
    -- java dependencies
    {
        src = 'https://github.com/JavaHello/spring-boot.nvim',
        version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
    },
    { src = 'https://github.com/MunifTanjim/nui.nvim' },
    { src = 'https://github.com/nvim-java/nvim-java.git' },
    { src = 'https://github.com/uga-rosa/ccc.nvim.git' },
    { src = 'https://github.com/chomosuke/typst-preview.nvim.git' },
})

--------------------- PLUGIN SETTINGS -------------------------
require('tokyonight').setup({})
vim.cmd [[colorscheme tokyonight-night]]

require('which-key').setup({})

require('nvim-treesitter').install({ 'rust', 'c', 'lua', 'java', 'kotlin', 'python' })

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

require('java').setup()

require("ccc").setup()

require('typst-preview').setup()

--------------------- mini.nvim -------------------------
require('mini.surround').setup()
require('mini.icons').setup()

-- telescope
require('telescope').setup({})

-- project_nvim
require('project_nvim').setup({})
require('telescope').load_extension('projects')

require('render-markdown').setup({})
