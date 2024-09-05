return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-buffer" },
        { "https://codeberg.org/FelipeLema/cmp-async-path.git" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            -- Disable preselect for irrespective servers.
            preselect = cmp.PreselectMode.None,

            completion = {
                completeopt = "menu,noinsert,noselect,fuzzy",
            },

            performance = {
                debounce = 10,
                throttle = 5,
                max_view_entries = 50,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            }),

            window = {
                completion = { scrollbar = false },
                documentation = { scrollbar = false },
            },

            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                {
                    name = "async_path",
                    options = { trailing_slash = true, show_hidden_files_by_default = true },
                },
            },

            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[ls]",
                        luasnip = "[sn]",
                        buffer = "[bu]",
                        async_path = "[pa]",
                    })[entry.source.name]
                    return vim_item
                end,
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
        })
    end,
}
