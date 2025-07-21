local tsc = require('telescope.builtin')
vim.keymap.set("n", "<Tab>", function() tsc.buffers({sort_mru = true, ignore_current_buffer = true}) end, {})
vim.keymap.set("n", "<C-f>", tsc.find_files, {})
vim.keymap.set('n', '<C-g>', tsc.git_files, {})


