local git = require("gitsigns")

git.setup()

vim.keymap.set("n", "<leader>gr", function() git.reset_hunk() end)
vim.keymap.set("n", "<leader>gi", function() git.stage_hunk() end)
vim.keymap.set("n", "<leader>gb", function() git.toggle_current_line_blame() end)
vim.keymap.set("n", "<leader>gd", function() git.diffthis() end)
