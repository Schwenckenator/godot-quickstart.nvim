# godot-quickstart.nvim
A simple plugin to setup basic Godot integration with neovim.

To open scripts from Godot, you need to change the following settings.

Text Editor > External > Exec Path
`nvim`
Text Editor > External > Exec Flags 
`--server {project}/godot.pipe --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line}+1,{col})<CR>"`

If the neovim executable is not in your `PATH`, specify the full path.
(I would just recommend adding nvim to your path)
`/home/{username}/bin/nvim` or `/opt/homebrew/bin/nvim`


