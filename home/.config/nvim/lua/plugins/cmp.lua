return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip/loaders/from_vscode").lazy_load()

        cmp.setup({
            performance = {
                debounce = 10,
                throttle = 5,
                max_view_entries = 50,
            },

            -- Disable preselect for irrespective servers.
            preselect = cmp.PreselectMode.None,

            completion = {
                completeopt = "menu,noinsert,noselect,fuzzy",
            },

            window = {
                completion = { scrollbar = false },
                documentation = { scrollbar = false },
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
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

            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[ls]",
                        luasnip = "[sn]",
                        buffer = "[bu]",
                        path = "[pa]",
                    })[entry.source.name]
                    return vim_item
                end,
            },

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, { { name = "buffer" } }),

            duplicates = {
                nvim_lsp = 1,
                luasnip = 1,
                buffer = 1,
                path = 1,
                nvim_lua = 1,
            },
        })
    end,
}
