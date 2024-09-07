return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "andymass/vim-matchup",
        lazy = true,
        config = function()
            vim.g.matchup_matchparen_offscreen = {}
            vim.g.matchup_surround_enabled = 1
            vim.g.matchup_override_vimtex = 1
            vim.g.matchup_transmute_enabled = 1
            vim.b.matchup_matchparen_fallback = 0
        end,
    },
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        config = function()
            require("ts-comments").setup()
        end,
    },
    {
        "stevearc/oil.nvim",
        lazy = false,
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
                watch_for_changes = true,
                view_options = {
                    show_hidden = true,
                    natural_order = false,
                },
                win_options = {
                    -- signcolumn = vim.wo.signcolumn,
                    -- number = vim.wo.number,
                    number = false,
                    cursorline = true,
                },
                float = { border = "single" },
                preview = { border = "single" },
                progress = { border = "single" },
                ssh = { border = "single" },
                keymaps_help = { border = "single" },
            })
            vim.keymap.set("n", "-", vim.cmd.Oil)
        end,
    },
    {

        "mbbill/undotree",
        keys = "<leader>u",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },
    {
        "folke/zen-mode.nvim",
        keys = "<leader>z",
        config = function()
            require("zen-mode").setup({
                window = {
                    width = 0.70,
                    backdrop = 0.90,
                },
            })
            vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npx --yes yarn install",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = "markdown",
        keys = "<leader>m",
        config = function()
            vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<cr>")
        end,
    },
    {
        "terrastruct/d2-vim",
        ft = "d2",
    },
    {
        "habamax/vim-asciidoctor",
        ft = { "asciidoc", "asciidoctor" },
        config = function()
            vim.g.asciidoctor_fenced_languages = { "python", "c", "sh", "bash", "go", "rust" }
        end,
    },
    {
        "jakewvincent/mkdnflow.nvim",
        ft = "markdown",
        config = function()
            require("mkdnflow").setup({
                perspective = {
                    priority = "current",
                    fallback = "first",
                },
                links = {
                    transform_explicit = function(text)
                        return string.lower(text:gsub(" ", "-"))
                    end,
                },
                new_file_template = {
                    use_template = true,
                },
                mappings = {
                    MkdnNextHeading = false,
                    MkdnPrevHeading = false,
                    MkdnCreateLinkFromClipboard = false,
                    MkdnDestroyLink = false,
                    MkdnTagSpan = false,
                    MkdnMoveSource = false,
                    MkdnYankAnchorLink = false,
                    MkdnYankFileAnchorLink = false,
                    MkdnIncreaseHeading = false,
                    MkdnDecreaseHeading = false,
                    MkdnUpdateNumbering = false,
                    MkdnTableNextRow = false,
                    MkdnFoldSection = false,
                    MkdnUnfoldSection = false,
                },
            })
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("AutowriteMarkdown", { clear = true }),
                pattern = "markdown",
                callback = function()
                    vim.opt_local.autowriteall = true
                end,
            })
        end,
    },
}
