return {
    {
        "mfussenegger/nvim-dap",
        enabled = false,
        lazy = true,
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "nvim-neotest/nvim-nio" },
            { "theHamsta/nvim-dap-virtual-text" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_virtual_text = require("nvim-dap-virtual-text")

            dapui.setup()
            dap_virtual_text.setup()

            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

            vim.keymap.set("n", "<leader>?", function()
                dapui.eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<leader>s", dap.continue)
            vim.keymap.set("n", "<down>", dap.step_into)
            vim.keymap.set("n", "<up>", dap.step_over)
            vim.keymap.set("n", "<right>", dap.step_out)
            vim.keymap.set("n", "<left>", dap.step_back)
            vim.keymap.set("n", "<leader>r", dap.restart)

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        enabled = false,
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
            -- require("dap-python").setup(vim.fn.stdpath("data" .. "/mason/packages/debugpy/venv/bin/python"))
        end,
    },
    {
        "leoluz/nvim-dap-go",
        enabled = false,
        ft = { "go", "gomod", "gosum", "gowork" },
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-go").setup()
        end,
    },
}
