-- Godot_Server_Pipe_Started = false

-- Module
local M = {}

M.setup = function(opts)
  local project_dirs = opts.project_dirs or { '' }

  local start_pipe = require 'godot-quickstart.start-pipe'

  start_pipe(project_dirs)
end

return M
