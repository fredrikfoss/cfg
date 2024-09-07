return {
    "echasnovski/mini.hues",
    lazy = false,
    priority = 1000,
    config = function()
        require("mini.hues").setup({
            background = "#242424",
            foreground = "#ffffff",
            saturation = "high",
            accent = "fg",

            -- background = "#000000",
            -- background = "#222222",
            -- background = "#1a1a1a",
            -- background = "#1c1f20",
            -- background = "#101414",
            -- foreground = "#cccccc",
        })

        vim.api.nvim_set_hl(0, "ModeMsg", { link = "Normal" })
        vim.api.nvim_set_hl(0, "StatusLine", { link = "StatuslineNC" })
        vim.api.nvim_set_hl(0, "Title", { link = "Bold" })
        vim.api.nvim_set_hl(0, "Visual", { reverse = true })
    end,
}
