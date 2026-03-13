vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.clipboard = "unnamedplus"

vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=true})]]

vim.cmd.colorscheme("habamax")

vim.opt.list = true -- Глобальный рубильник включен
vim.opt.listchars = {
    tab = "→ ",
    trail = "·",
    multispace = "·",
    nbsp = "␣",
}

-- Terminal

vim.keymap.set('n', '<leader>ts', function()
    vim.cmd('botright split | resize 15 | terminal')
    vim.cmd('startinsert')
end, { desc = 'Open terminal in horizontal split' })

vim.keymap.set('n', '<leader>tv', function()
    vim.cmd('rightbelow vsplit | terminal')
    vim.cmd('startinsert')
end, { desc = 'Open terminal in horizontal split' })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Highlight on_yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
