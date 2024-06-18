local wk = require("which-key")
local conf = require("telescope.config").values

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set({ "i", "n" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "i", "n" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "i", "n" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "i", "n" }, "<C-l>", "<C-w>l")

wk.register({
	f = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		w = { "<cmd>Telescope live_grep<cr>", "Find Words" },
		b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
		c = { "<cmd>Telescope commands<cr>", "Search Commands" },

		l = { "<cmd>Telescope lsp_document_symbols<cr>", "Search LSP Symbols" },
		s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Search LSP Workspace Symbols" },
		o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Search Outgoing Calls" },
		i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Search Incoming Calls" },

		r = { "<cmd> Telescope registers<cr>", "Search Registers" },
		m = { "<cmd> Telescope marks<cr>", "Search Marks" },

		["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Current Buffer" },
	},
	e = { "<cmd>Neotree action=focus position=float<cr>", "File Explorer" },
	w = { "<cmd>wa<cr>", "Write Files" },
	q = { "<cmd>q<cr>", "Quit Files" },
	c = { "<cmd>bdelete<cr>", "Close Buffer" },
	[";"] = { "<cmd>TermSelect<cr>", "Select Terminal" },
  u = {
    name = "UI",
    t = {
      name = "Colorscheme",
      d = { "<cmd>colorscheme tokyonight-day<cr>", "Day Theme" },
      n = { "<cmd>colorscheme tokyonight-night<cr>", "Night Theme" },
      s = { "<cmd>colorscheme tokyonight-storm<cr>", "Storm Theme" },
    },
  },
  d = {
    name = "Debugger",
    u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    s = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
  },
	t = {
		name = "Terminal",
		["1"] = { "<cmd>1ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 1" },
		["2"] = { "<cmd>2ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 2" },
		["3"] = { "<cmd>3ToggleTerm direction=horizontal size=20<cr>", "Bottom Terminal 3" },
		f = { "<cmd>4ToggleTerm direction=float size=20<cr>", "Floating Terminal" },
    v = { "<cmd>5ToggleTerm direction=vertical size=60<cr>", "Right Terminal" },
	},
  b = {"<cmd>bprevious<cr>", "Back"},
	g = { "<cmd>LazyGit<cr>", "LazyGit" },
}, { prefix = "<leader>" })

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

		wk.register({
			D = { vim.lsp.buf.declaration, "Go to Declaration", opts },
			d = { vim.lsp.buf.definition, "Go to Definition", opts },
			i = { vim.lsp.buf.implementation, "Go to Implementation", opts },
			r = { vim.lsp.buf.references, "Go to References", opts },
			t = { vim.lsp.buf.type_definition, "Go to Type Definition", opts },
		}, { prefix = "g" })

		wk.register({
			name = "LSP",
			a = { vim.lsp.buf.code_action, "Code Action", opts },
			n = { vim.lsp.buf.rename, "Rename", opts },
			f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format", opts },

			h = { vim.lsp.buf.hover, "Hover", opts },
			d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics", opts },
		}, { prefix = "<leader>l" })
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
