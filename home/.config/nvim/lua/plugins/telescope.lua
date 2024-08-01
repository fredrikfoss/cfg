return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "CFLAGS='-march=native -O3 -flto -fomit-frame-pointer -pipe' make",
        },
    },
    keys = {
        "<leader>e",
        "<leader>/",
        "<leader>d",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                prompt_prefix = ">>> ",
                borderchars = {
                    prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                    results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
                results_title = false,
                prompt_title = false,
                mappings = {
                    i = {
                        ["<C-n>"] = "move_selection_next",
                        ["<C-p>"] = "move_selection_previous",
                        ["<Esc>"] = "close",
                    },
                },
                preview = false,
                file_ignore_patterns = { "^.git/" },
            },

            pickers = {
                find_files = {
                    prompt_title = false,
                    find_command = { "fd", "--type", "f", "--color", "never" },
                    follow = true,
                    hidden = true,
                    layout_config = {
                        width = 0.5,
                        height = 0.7,
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                },
                live_grep = {
                    preview = true,
                    prompt_title = false,
                    preview_title = false,
                    additional_args = { "--hidden", "--follow" },
                    layout_config = {
                        horizontal = {
                            width = 0.7,
                            height = 0.7,
                            preview_width = 0.5,
                        },
                    },
                },
                diagnostics = {
                    preview = true,
                    prompt_title = false,
                    preview_title = false,
                    bufnr = nil,
                    layout_config = {
                        horizontal = {
                            width = 0.7,
                            height = 0.7,
                            preview_width = 0.5,
                        },
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>e", builtin.find_files)
        vim.keymap.set("n", "<leader>/", builtin.live_grep)
        vim.keymap.set("n", "<leader>d", builtin.diagnostics)
    end,
}
