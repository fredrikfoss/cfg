return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        "<leader>a",
        "<leader>h",
        "<leader>1",
        "<leader>2",
        "<leader>3",
        "<leader>4",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "<leader>h", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end)

        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end)

        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end)

        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end)
    end,
}
