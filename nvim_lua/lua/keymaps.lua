vim.g.mapleader = " "

-- tab
vim.keymap.set("n", "<leader>to", vim.cmd.tabnew, { desc = "tab new" })
vim.keymap.set("n", "<leader>tn", vim.cmd.tabn, { desc = "tab next" })
vim.keymap.set("n", "<leader>tp", vim.cmd.tabp, { desc = "tab previous" })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "tab close" })

-- buffers
vim.keymap.set("n", "<leader>bc", vim.cmd.bufferdelete, { desc = "buffer close" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "buffer previous" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "buffer next" })

-- packer
vim.keymap.set("n", "<leader>ps", vim.cmd.PackerSync, { desc = "Packer Sync" })


-- imap
vim.keymap.set("i", "{", "{}<Left><Return><Esc>O")

vim.keymap.set("i", "{{", "{")
vim.keymap.set("i", "{}", "{}")

vim.keymap.set("i", "(",  "()<Left>")
vim.keymap.set("i", "()", "()")
vim.keymap.set("i", "((", "(")

vim.keymap.set("i", '"',  '""<Left>')
vim.keymap.set("i", '""', '"')
vim.keymap.set("i", '"""', '""')

vim.keymap.set("i", "'",  "''<Left>")
vim.keymap.set("i", "''",  "'")

vim.keymap.set("i", "<",  "><Left><")
vim.keymap.set("i", "<<", "<<")
vim.keymap.set("i", "<<Space>", "<<Space>")
vim.keymap.set("i", "<=",  "<=")
vim.keymap.set("i", "<>",  "<>")

vim.keymap.set("i", "[",  "[]<Left>")
vim.keymap.set("i", "[]", "[]")
vim.keymap.set("i", "[[", "[")

vim.keymap.set("i", "#pr", "#pragma<Space>once<Return><Return>")
vim.keymap.set("i", "#inc", "#include<Space>")
