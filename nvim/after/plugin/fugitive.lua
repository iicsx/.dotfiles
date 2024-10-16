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

local function starts_with(str, start)
  return str:sub(1, #start) == start
end

local function needs_linebreak(line)
  local is_start_of_body = starts_with(line, "Changes")
  local is_end_of_body = starts_with(line, "Summary")
  local is_start_of_footer = starts_with(line, "no changes")

  return is_start_of_body or is_end_of_body or is_start_of_footer
end

local function get_git_status()
  local output = vim.fn.system("git status")

  if vim.v.shell_error ~= 0 then
    print("Error running git status: " .. output)
    return nil
  end

  local lines = {}
  for line in output:gmatch("[^\r\n]+") do
    if needs_linebreak(line) then
      table.insert(lines, "")
    end

    table.insert(lines, line)
  end

  return lines
end

local function git_status_float()
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  vim.api.nvim_buf_set_option(buf, 'syntax', 'git')

  local width = math.min(vim.o.columns - 2, 80)
  local height = math.min(vim.o.lines - 2, 20)

  local _ = vim.api.nvim_open_win(buf, true, {
    title = ' Git status ',
    relative = 'editor',
    style = 'minimal',
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    border = 'rounded',
  })

  local status_lines = get_git_status()
  if status_lines then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, status_lines)
  end
end

-- Commands
vim.api.nvim_create_user_command('GitStatus', git_status_float, {})
vim.keymap.set("n", "<leader>gs", git_status_float)

vim.keymap.set("n", "<leader>gc", function()
  if is_stage_empty() then
    vim.notify("No staged changes to commit", vim.log.levels.INFO)
    return
  end

  commit()
end)
