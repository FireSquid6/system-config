local wk = require("which-key")
local conf = require("telescope.config").values

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set({ "i", "n" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "i", "n" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "i", "n" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "i", "n" }, "<C-l>", "<C-w>l")
wk.add({
  { "<leader>;",   "<cmd>TermSelect<cr>",                               desc = "Select Terminal" },
  { "<leader>h",   "<cmd>HopWord<cr>",                                  desc = "Hop" },
  { "<leader>b",   "<cmd>bprevious<cr>",                                desc = "Back" },
  { "<leader>c",   "<cmd>bdelete<cr>",                                  desc = "Close Buffer" },
  { "<leader>d",   group = "Debugger" },
  { "<leader>db",  "<cmd>lua require('dap').toggle_breakpoint()<cr>",   desc = "Toggle Breakpoint" },
  { "<leader>ds",  "<cmd>lua require('dap').continue()<cr>",            desc = "Continue" },
  { "<leader>du",  "<cmd>lua require('dapui').toggle()<cr>",            desc = "Toggle UI" },
  { "<leader>e",   "<cmd>Oil<cr>",                                      desc = "File Explorer" },
  { "<leader>f",   group = "Find" },
  { "<leader>f/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>",      desc = "Search Current Buffer" },
  { "<leader>fb",  "<cmd>Telescope buffers<cr>",                        desc = "Find Buffers" },
  { "<leader>fc",  "<cmd>Telescope commands<cr>",                       desc = "Search Commands" },
  { "<leader>fe",  "<cmd> Telescope diagnostics<cr>",                   desc = "Search Diagnostics" },
  { "<leader>ff",  "<cmd>Telescope find_files<cr>",                     desc = "Find Files" },
  { "<leader>fi",  "<cmd>Telescope lsp_incoming_calls<cr>",             desc = "Search Incoming Calls" },
  { "<leader>fl",  "<cmd>Telescope lsp_document_symbols<cr>",           desc = "Search LSP Symbols" },
  { "<leader>fm",  "<cmd> Telescope marks<cr>",                         desc = "Search Marks" },
  { "<leader>fo",  "<cmd>Telescope lsp_outgoing_calls<cr>",             desc = "Search Outgoing Calls" },
  { "<leader>fr",  "<cmd> Telescope registers<cr>",                     desc = "Search Registers" },
  { "<leader>fs",  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",  desc = "Search LSP Workspace Symbols" },
  { "<leader>fw",  "<cmd>Telescope live_grep<cr>",                      desc = "Find Words" },
  { "<leader>g",   "<cmd>LazyGit<cr>",                                  desc = "LazyGit" },
  { "<leader>q",   "<cmd>q<cr>",                                        desc = "Quit Files" },
  { "<leader>s",   "<cmd>Telescope spell_suggest<cr>",                  desc = "Spell Suggest" },
  { "<leader>t",   group = "Terminal" },
  { "<leader>t1",  "<cmd>1ToggleTerm direction=horizontal size=20<cr>", desc = "Bottom Terminal 1" },
  { "<leader>t2",  "<cmd>2ToggleTerm direction=horizontal size=20<cr>", desc = "Bottom Terminal 2" },
  { "<leader>t3",  "<cmd>3ToggleTerm direction=horizontal size=20<cr>", desc = "Bottom Terminal 3" },
  { "<leader>tf",  "<cmd>4ToggleTerm direction=float size=20<cr>",      desc = "Floating Terminal" },
  { "<leader>tv",  "<cmd>5ToggleTerm direction=vertical size=60<cr>",   desc = "Right Terminal" },
  { "<leader>u",   group = "UI" },
  { "<leader>ut",  group = "Colorscheme" },
  { "<leader>utd", "<cmd>colorscheme tokyonight-day<cr>",               desc = "Day Theme" },
  { "<leader>utn", "<cmd>colorscheme tokyonight-night<cr>",             desc = "Night Theme" },
  { "<leader>uts", "<cmd>colorscheme tokyonight-storm<cr>",             desc = "Storm Theme" },
  { "<leader>w",   "<cmd>wa<cr>",                                       desc = "Write Files" },
})

-- wk.register({
--   f = {
--     name = "Find",
--     f = { "<cmd>Telescope find_files<cr>", "Find Files" },
--     w = { "<cmd>Telescope live_grep<cr>", "Find Words" },
--     b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
--     c = { "<cmd>Telescope commands<cr>", "Search Commands" },
--
--     l = { "<cmd>Telescope lsp_document_symbols<cr>", "Search LSP Symbols" },
--     s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Search LSP Workspace Symbols" },
--     o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Search Outgoing Calls" },
--     i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Search Incoming Calls" },
--
--     r = { "<cmd> Telescope registers<cr>", "Search Registers" },
--     m = { "<cmd> Telescope marks<cr>", "Search Marks" },
--     e = { "<cmd> Telescope diagnostics<cr>", "Search Diagnostics" },
--
--     ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Current Buffer" },
--   },
--   e = { "<cmd>Oil<cr>", "File Explorer" },
--   w = { "<cmd>wa<cr>", "Write Files" },
--   q = { "<cmd>q<cr>", "Quit Files" },
--   c = { "<cmd>bdelete<cr>", "Close Buffer" },
--   [";"] = { "<cmd>TermSelect<cr>", "Select Terminal" },
--   u = {
--     name = "UI",
--     t = {
--       name = "Colorscheme",
--       d = { "<cmd>colorscheme tokyonight-day<cr>", "Day Theme" },
--       n = { "<cmd>colorscheme tokyonight-night<cr>", "Night Theme" },
--       s = { "<cmd>colorscheme tokyonight-storm<cr>", "Storm Theme" },
--     },
--   },
--   d = {
--     name = "Debugger",
--     u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
--     b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--     s = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
--   },
--   t = {
--     name = "Terminal",
--     ["1"] = { "<cmd>1ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 1" },
--     ["2"] = { "<cmd>2ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 2" },
--     ["3"] = { "<cmd>3ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 3" },
--     f = { "<cmd>4ToggleTerm direction=float size=20<cr>", "Floating Terminal" },
--     v = { "<cmd>5ToggleTerm direction=vertical size=60<cr>", "Right Terminal" },
--   },
--   b = { "<cmd>bprevious<cr>", "Back" },
--   g = { "<cmd>LazyGit<cr>", "LazyGit" },
--   s = { "<cmd>Telescope spell_suggest<cr>", "Spell Suggest" }
-- }, { prefix = "<leader>" })
--
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

vim.keymap.set("v", "<leader>c", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    -- wk.register({
    --   D = { vim.lsp.buf.declaration, "Go to Declaration", opts },
    --   d = { vim.lsp.buf.definition, "Go to Definition", opts },
    --   i = { vim.lsp.buf.implementation, "Go to Implementation", opts },
    --   r = { vim.lsp.buf.references, "Go to References", opts },
    --   t = { vim.lsp.buf.type_definition, "Go to Type Definition", opts },
    -- }, { prefix = "g" })

    wk.add({
      { "gD", vim.lsp.buf.declaration,     desc = "Go to Declaration" },
      { "gd", vim.lsp.buf.definition,      desc = "Go to Definition" },
      { "gi", vim.lsp.buf.implementation,  desc = "Go to Implementation" },
      { "gr", vim.lsp.buf.references,      desc = "Go to References" },
      { "gt", vim.lsp.buf.type_definition, desc = "Go to Type Definition" },
    })

    -- wk.register({
    --   name = "LSP",
    --   a = { vim.lsp.buf.code_action, "Code Action", opts },
    --   n = { vim.lsp.buf.rename, "Rename", opts },
    --   f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format", opts },
    --
    --   h = { vim.lsp.buf.hover, "Hover", opts },
    --   d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics", opts },
    -- }, { prefix = "<leader>l" })

    wk.add({
      { "<leader>l",  group = "LSP" },
      { "<leader>la", vim.lsp.buf.code_action,                    desc = "Code Action" },
      { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",        desc = "Format" },
      { "<leader>lh", vim.lsp.buf.hover,                          desc = "Hover" },
      { "<leader>ln", vim.lsp.buf.rename,                         desc = "Rename" },
    })
  end,
})

-- FORMAT ON SAVE
-- I turned this off because it was annoying
--
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- augroup("__formatter__", { clear = true })
-- autocmd("BufWritePost", {
-- 	command = ":lua vim.lsp.buf.format()",
-- })
