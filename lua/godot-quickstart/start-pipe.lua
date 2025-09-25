--- Start the pipe to listen for Godot commands
---@param project_dirs string[]?
local function start_pipe(project_dirs)
  local dirs = project_dirs or { '' }
  local godot_project_path = ''
  local cwd = vim.fn.getcwd()

  -- Search each dir for a 'project.godot'
  for _, dir in ipairs(dirs) do
    if vim.uv.fs_stat(cwd .. dir .. '/project.godot') then
      godot_project_path = cwd .. dir
    end
  end

  if godot_project_path == '' then
    -- Didn't find a godot project
    return false
  end

  -- Start server if not already running
  local godot_pipe_path = godot_project_path .. '/godot.pipe'

  if not vim.uv.fs_stat(godot_pipe_path) then
    vim.fn.serverstart(godot_pipe_path)
    -- Set global that we started the pipe
    vim.g.godot_server_pipe_started = true
  end
end

return start_pipe
