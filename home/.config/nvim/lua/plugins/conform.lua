return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = false,
            notify_no_formatters = false,
            formatters_by_ft = {
                arduino = { "clang-format" },
                asm = { "asmfmt" },
                -- c = { "clang-format" },
                d2 = { "d2" },
                go = { "gofumpt", "gofmt", stop_after_first = true },
                java = { "clang-format" },
                json = { "jq" },
                jsonc = { "jq" },
                lua = { "stylua" },
                -- markdown = { "markdownfmt" },
                perl = { "perltidy" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                sh = { "shfmt" },
                systemverilog = { "verible" },
                toml = { "taplo" },
                vhdl = { "vsg" },
                yaml = { "yq" },
                zig = { "zigfmt" },
                typst = { "typstyle", "trim_newlines" },
                ["*"] = { "injected" },
                ["_"] = { "trim_whitespace", "trim_newlines" },
            },
        })

        vim.keymap.set("n", "=", function()
            conform.format({ async = true, lsp_format = "fallback" })
        end)
    end,
}
