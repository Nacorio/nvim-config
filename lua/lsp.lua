--------------------- LSP -------------------------
vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config { virtual_text = true }

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable('rust_analyzer')

vim.lsp.config("qmlls", {
    cmd = { "qmlls6" },
    filetypes = { "qml" }
})
vim.lsp.enable("qmlls")

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
