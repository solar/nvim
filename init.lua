-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

vim.g.is_mac = vim.fn.has('mac') == 1

require("plugins")
require("common")

if vim.g.vscode == 1 then
  require("code")
else
  require("default")
end
