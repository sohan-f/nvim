-- Core

local opt = vim.opt
local api = vim.api

opt.laststatus = 3

-- Numbers
opt.number = true
opt.relativenumber = true

-- UI
opt.cmdheight = 1
opt.showcmd = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }
opt.mousefocus = true
opt.winborder = "rounded"

-- Dynamic scrolloff
local function update_scrolloff()
	opt.scrolloff = math.floor(vim.o.lines * 0.2)
end

api.nvim_create_autocmd({ "VimResized", "UIEnter" }, {
	group = api.nvim_create_augroup("DynamicScrolloff", { clear = true }),
	callback = update_scrolloff,
})

update_scrolloff()

-- Indent
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "nosplit"
opt.ignorecase = true
opt.smartcase = true

-- File
opt.swapfile = true
opt.backup = false
opt.undofile = true
opt.backspace = { "start", "eol", "indent" }

-- Wrap
opt.wrap = false
opt.linebreak = false
vim.opt.breakindent = false

-- Highlight
local function set_hl()
	api.nvim_set_hl(0, "LineNr", { fg = "#ff9e64" })
end

api.nvim_create_autocmd("ColorScheme", {
	group = api.nvim_create_augroup("CustomHighlights", { clear = true }),
	callback = set_hl,
})

set_hl()

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},

	float = {
		source = "always",
		focusable = true,
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		if vim.fn.mode() == "n" then
			vim.diagnostic.open_float(nil, { focusable = false })
		end
	end,
})
