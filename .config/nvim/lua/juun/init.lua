require("juun.remap")
require("juun.packer")

vim.cmd.colorscheme "onedark"

vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.bs = {"indent", "eol", "start"}
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = {120}
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.scrolloff = 8

vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.cindent = false
vim.opt.indentexpr=""
vim.cmd.filetype "indent off"
vim.cmd.filetype "plugin off"

vim.g.lightline = { colorscheme= "wombat" }

