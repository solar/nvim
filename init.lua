-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

require("plugins")
require("common")

if vim.g.vscode == 1 then
  require("vscode")
else
  require("default")
end

