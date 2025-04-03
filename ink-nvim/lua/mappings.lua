local wk = require("which-key")

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set({ "i", "n" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "i", "n" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "i", "n" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "i", "n" }, "<C-l>", "<C-w>l")

wk.add({
  { "<leader>c",   "<cmd>bdelete<cr>",                                  desc = "Close Buffer" },
  { "<leader>l",   group = "LSP" },
  { "<leader>e",   "<cmd>Oil<cr>",                                      desc = "File Explorer" },
  { "<leader>f",   group = "Find" },
  { "<leader>f/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>",      desc = "Search Current Buffer" },
  { "<leader>fb",  "<cmd>Telescope buffers<cr>",                        desc = "Find Buffers" },
  { "<leader>fc",  "<cmd>Telescope commands<cr>",                       desc = "Search Commands" },
  { "<leader>fe",  "<cmd>Telescope diagnostics<cr>",                    desc = "Search Diagnostics" },
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
  { "<leader>u",   group = "UI" },
  { "<leader>ut",  group = "Colorscheme" },
  { "<leader>utd", "<cmd>colorscheme tokyonight-day<cr>",               desc = "Day Theme" },
  { "<leader>utn", "<cmd>colorscheme tokyonight-night<cr>",             desc = "Night Theme" },
  { "<leader>uts", "<cmd>colorscheme tokyonight-storm<cr>",             desc = "Storm Theme" },
  { "<leader>w",   "<cmd>wa<cr>",                                       desc = "Write Files" },
  { "<leader>li",  "<cmd>LspInfo<cr>",                                  desc = "Lsp Info" },
})

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

    wk.add({
      { "gD", vim.lsp.buf.declaration,     desc = "Go to Declaration" },
      { "gd", vim.lsp.buf.definition,      desc = "Go to Definition" },
      { "gi", vim.lsp.buf.implementation,  desc = "Go to Implementation" },
      { "gr", vim.lsp.buf.references,      desc = "Go to References" },
      { "gt", vim.lsp.buf.type_definition, desc = "Go to Type Definition" },
    })

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
