return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        config = function()
            require("mason").setup({
                pip = { upgrade_pip = true },
                ui = { border = "single" },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = true,
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                auto_update = false,
                run_on_start = false,
                ensure_installed = {
                    "asmfmt",
                    "bashls",
                    "clang-format",
                    "gofumpt",
                    "golangci-lint",
                    "gopls",
                    "jdtls",
                    "jedi_language_server",
                    "jq",
                    "lua_ls",
                    "r_language_server",
                    "ruff",
                    "shellcheck",
                    "shfmt",
                    "stylua",
                    "tinymist",
                    "verible",
                    "yq",
                    -- "arduino_language_server",
                    -- "asm_lsp",
                    -- "clangd",
                    -- "vhdl_ls",
                    -- "zls",
                },
            })
        end,
    },
}
