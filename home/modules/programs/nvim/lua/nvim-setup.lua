vim.g.mapleader = " "

vim.opt.number      = true
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.clipboard   = "unnamedplus"
-- vim.opt.guicursor = ""

vim.keymap.set("v", "y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"+p', { noremap = true, silent = true })

vim.keymap.set({"n", "v"}, "<C-a>", "ggVG", { noremap = true, silent = true })

vim.keymap.set({"n", "v"}, "<Leader>i", function()
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" then
        vim.cmd("normal! =")
    else
        vim.cmd("normal! gg=G")
    end
end, { noremap = true, silent = true })
