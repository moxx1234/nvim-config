return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "cssls",
            "css_variables",
            "cssmodules_ls",
            "emmet_ls",
            "eslint",
            "html",
            "jsonls",
            "lua_ls",
            "prismals",
            "pyright",
            "pylsp",
            "tailwindcss",
            "ts_ls",
            "yamlls",
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
