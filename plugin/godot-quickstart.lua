-- Automatically runs on launch (No setup() necessary here!)
if not vim.g.godot_server_pipe_started then
  local start_pipe = require 'godot-quickstart.start-pipe'
  start_pipe()
end
