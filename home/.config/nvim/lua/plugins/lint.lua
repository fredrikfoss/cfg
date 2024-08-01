return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            -- c = { "clang-tidy" },
            go = { "golangcilint" },
            -- python = { "ruff" },
            vhdl = { "ghdl", "vsg" },
        }

        -- TODO: Make it also start when opening new file first time.
        vim.api.nvim_create_autocmd(
            { "BufWritePost", "BufEnter", "BufReadPost", "BufWinEnter", "TextChanged", "InsertLeave" },
            {
                group = vim.api.nvim_create_augroup("AttachLinter", { clear = true }),
                callback = function()
                    lint.try_lint(nil, { ignore_errors = true })
                end,
            }
        )
    end,
}
