return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        require("lspconfig.ui.windows").default_options.border = "single"

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<space>wl", function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
            end,
        })

        -- Lua
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    hint = { enable = true },
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        })

        -- SystemVerilog
        lspconfig.verible.setup({
            capabilities = capabilities,
        })

        -- Zig
        -- lspconfig.zls.setup({
        --     capabilities = capabilities,
        -- })

        -- C/C++
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

        -- Java
        lspconfig.jdtls.setup({
            capabilities = capabilities,
        })

        -- Bash/sh
        lspconfig.bashls.setup({
            capabilities = capabilities,
        })

        -- VHDL
        -- lspconfig.vhdl_ls.setup({
        --     capabilities = capabilities,
        -- })

        -- Arduino
        lspconfig.arduino_language_server.setup({
            capabilities = capabilities,
        })

        -- Typst
        lspconfig.tinymist.setup({
            capabilities = capabilities,
        })

        -- R
        lspconfig.r_language_server.setup({
            capabilities = capabilities,
        })

        -- Python
        lspconfig.ruff.setup({
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.hoverProvider = false
            end,
        })

        -- Python
        lspconfig.jedi_language_server.setup({
            capabilities = capabilities,
            init_options = {
                diagnostics = {
                    enable = false,
                },
            },
        })

        -- Go
        lspconfig.gopls.setup({
            capabilities = capabilities,
            -- workaround for gopls not supporting semanticTokensProvider
            -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
            -- (not sure if still needed)
            on_attach = function(client, _)
                if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
                    local semantic = client.config.capabilities.textDocument.semanticTokens
                    client.server_capabilities.semanticTokensProvider = {
                        full = true,
                        legend = {
                            tokenModifiers = semantic.tokenModifiers,
                            tokenTypes = semantic.tokenTypes,
                        },
                        range = true,
                    }
                end
            end,
            -- most from https://www.lazyvim.org/extras/lang/go#nvim-lspconfig
            -- and https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            settings = {
                gopls = {
                    gofumpt = true,
                    staticcheck = true,
                    usePlaceholders = true,
                    semanticTokens = true,
                    vulncheck = "Imports",
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    analyses = {
                        fieldalignment = true,
                        shadow = true,
                        unusedvariable = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    directoryFilters = {
                        "-.git",
                        "-.vscode",
                        "-.idea",
                        "-.vscode-test",
                        "-node_modules",
                    },
                },
            },
        })

        -- https://stackoverflow.com/q/78791451
        vim.cmd.LspStart()
    end,
}
