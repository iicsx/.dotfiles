local builtin = require('telescope.builtin')

--vim.keymap.set('n', '<leader>fa', builtin.find_files, {})

vim.keymap.set('n', '<leader>fa', function()
  builtin.find_files({
    shorten_path = true, 
    cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:gs?\\?/?'),
    path_display = { 'truncate' }
  })
end)

vim.keymap.set('n', '<leader>ft', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

