local function open_floating_commit_window(callback)
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 80
  local height = 20

  -- Ensure window is centered when opened
  local win_width = vim.api.nvim_get_option("columns")
  local win_height = vim.api.nvim_get_option("lines")
  local row = math.floor((win_height - height) / 2)
  local col = math.floor((win_width - width) / 2)

  local opts = {
    title = ' Commit message ',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.cmd('startinsert')

  -- Set up an autocmd to capture the buffer content when the window is closed
  vim.api.nvim_create_autocmd("BufWinLeave", {
    buffer = buf,
    callback = function()
      local commit_message = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      commit_message = table.concat(commit_message, "\n")

      callback(commit_message)

      vim.api.nvim_win_close(win, true)
    end,
  })
end

local function is_stage_empty()
  local staged_changes = vim.fn.system("git diff --cached")

  return staged_changes == ""
end

local function commit()
  open_floating_commit_window(function(commit_message)
    if commit_message == "" then
      vim.notify("Commit message is empty", vim.log.levels.WARN)
      return
    end

    -- Use a temporary file to store the commit message
    local temp_file = vim.fn.tempname()
    local file = io.open(temp_file, "w")
    if not file then
      vim.notify("Failed to create temporary file for commit", vim.log.levels.ERROR)
      return
    end

    file:write(commit_message)
    file:close()

    vim.cmd("Git commit -F " .. temp_file)

    os.remove(temp_file)
  end)
end

vim.keymap.set("n", "<leader>gc", function()
  if is_stage_empty() then
    vim.notify("No staged changes to commit", vim.log.levels.INFO)
    return
  end

  commit()
end)
