require("plugins")
require("keymaps")
print("init lua")

local set = vim.opt
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

set.splitbelow = true
set.splitright = true
set.wrap = true
set.ruler = true
set.virtualedit = "all"
set.hidden = true
set.clipboard = "unamed"

set.foldmethod = "syntax"
