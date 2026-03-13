return {
    "stevearc/conform.nvim",
    opts = function()
        local prettier_configs = {
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            "package.json",
        }

        local function has_prettier(bufnr)
            local found = vim.fs.find(prettier_configs, {
                upward = true,
                path = vim.api.nvim_buf_get_name(bufnr),
            })

            if #found == 0 then
                return false
            end

            local cfg = found[1]

            if vim.endswith(cfg, "package.json") then
                local ok, json = pcall(vim.fn.json_decode, vim.fn.readfile(cfg))
                if ok and json and json.prettier then
                    return true
                else
                    return false
                end
            end

            return true
        end

        local function js_formatters(bufnr)
            if has_prettier(bufnr) then
                return { "prettier" }
            else
                return { "eslint", "ts_ls" }
            end
        end

        return {
            format_on_save = {
                lsp_fallback = true,
            },
            formatters_by_ft = {
                javascript = js_formatters,
                typescript = js_formatters,
                javascriptreact = js_formatters,
                typescriptreact = js_formatters,
                lua = { "stylua" },
                python = { "black" },
            },
        }
    end,
}
