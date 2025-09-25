-- Godot_Server_Pipe_Started = false

-- Module
local M = {}

local function load_dap()
  local ok, dap = pcall(require, 'dap')
  if not ok then
    return false
  end

  -- Setup Godot Adapters
  dap.adapters.godot = {
    type = 'server',
    host = '127.0.0.1',
    port = '6006',
  }

  dap.configurations.gdscript = {
    {
      type = 'godot',
      request = 'launch',
      name = 'Launch scene',
      project = '${workspaceFolder}',
      -- current = 'main', -- Doesn't work?
    },
  }
end

local function load_treesitter()
  local ok, ts = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return false
  end

  -- Installs gdscript and gdshader parsers
  ts.setup {
    ensure_installed = { 'gdscript', 'gdshader' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end

---@param opts { project_dirs: string[]? }?
M.setup = function(opts)
  -- Protect against nil
  opts = opts or {}

  -- Start pipe
  local project_dirs = opts.project_dirs or { '' }

  local start_pipe = require 'godot-quickstart.start-pipe'

  start_pipe(project_dirs)

  -- Configure DAP
  load_dap()

  -- load_treesitter()
end

return M
