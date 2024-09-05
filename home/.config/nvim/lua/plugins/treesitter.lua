return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0,
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "andymass/vim-matchup" },
    },
    init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                -- Following parsers are bundled with Nvim 0.10 itself, and need to be
                -- updated by nvim-treesitter so that nvim-treesitter's newer queries do not
                -- throw errors with the older Nvim parsers.
                "c",
                "lua",
                "markdown",
                "markdown_inline",
                "query",
                "vim",
                "vimdoc",

                -- These are extra parsers not bundled with Nvim.
                "arduino",
                "asm",
                "bash",
                "cpp",
                "diff",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "goctl",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "html",
                "ini",
                "java",
                "json",
                "jsonc",
                "latex",
                "luadoc",
                "luap",
                "make",
                "perl",
                "python",
                "r",
                "rust",
                "toml",
                "typst",
                "verilog",
                "vhdl",
                "yaml",
                "zig",
                -- "asciidoc",
                -- "comment", -- TODO: Is slow.
                -- "d2",
            },

            -- nvim-treesitter-textobjects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["ax"] = "@comment.outer",
                        ["ix"] = "@comment.inner",
                    },
                },
            },

            -- required by vim-matchup
            matchup = {
                enable = true,
            },
        })
    end,
}
