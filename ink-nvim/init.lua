local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.smartindent = false

require("options")
require("plugins")
require("mappings")
require("lsp")

vim.cmd 'colorscheme tokyonight-night'


-- autocommand for enabling spell on markdwon files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
})


-- local cwd = vim.loop.cwd()
-- local editorFile = cwd .. "/ink-editor.json"
--
--
-- local json = require("json")
--
-- local schema_string = [[
-- {
--   "ai": false,
--   "socket": true,
-- }
-- ]]
--
-- local schema = json.decode(schema_string)
-- schema.ai = schema.ai or true
-- schema.socket = schema.socket or false
