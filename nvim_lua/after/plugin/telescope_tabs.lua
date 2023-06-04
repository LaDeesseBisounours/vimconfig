local telescopetab = require('telescope-tabs')
vim.keymap.set('n', '<leader>ft', function () telescopetab.list_tabs() end, { desc = 'Telescope choose tab' })

