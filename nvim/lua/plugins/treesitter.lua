return {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "c", "lua", "rust", "bash", "java", "javascript", "typescript"},
            sync_install = true,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
