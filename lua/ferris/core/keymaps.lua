vim.g.mapleader = " "
vim.g.maplocalleader = " "

local u = require("ferris.utils")
local map = u.map

-- Basic
map("n", "<leader>q", "<cmd>q!<CR>", { silent = true, desc = "Quit force" })
map("n", "<leader>w", "<cmd>w<CR>", { silent = true, desc = "Save file" })

map("n", "<leader>uw", function()
	vim.opt.wrap = not vim.opt.wrap:get()
	vim.opt.breakindent = vim.opt.wrap:get()
	vim.opt.linebreak = vim.opt.wrap:get()
end, { desc = "Toggle Word Wrap" })

vim.g.clipboard = {
	name = "termux-clipboard",
	copy = {
		["+"] = "termux-clipboard-set",
		["*"] = "termux-clipboard-set",
	},
	paste = {
		["+"] = "termux-clipboard-get",
		["*"] = "termux-clipboard-get",
	},
}

vim.opt.clipboard = ""

-- Visual
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
map("v", "<", "<gv", { silent = true, desc = "Indent left" })
map("v", ">", ">gv", { silent = true, desc = "Indent right" })
map("x", "p", [["_dP]], { silent = true, desc = "Paste without yanking" })

-- Delete without yanking
map("n", "d", '"_d', { silent = true, desc = "Delete without yank" })
map("n", "D", '"_D', { silent = true, desc = "Delete to EOL without yank" })
map("n", "x", '"_x', { silent = true, desc = "Delete char without yank" })
map("n", "c", '"_c', { silent = true, desc = "Change without yank" })

-- Explicit clipboard yank
map("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Search
map("n", "n", "nzzzv", { desc = "Next result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev result (centered)" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename word under cursor" })

-- Standard buffer switching
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Buffers" })

-- Diagnostics
map("n", "<leader>dg", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Terminal runner
map("n", "<leader>ut", function()
	u.run("", "interactive")
end, { desc = "Interactive terminal" })

-- CLI nav
local wildmenu_keys = {
	["<Up>"] = 'wildmenumode() ? "\\<Left>"  : "\\<Up>"',
	["<Down>"] = 'wildmenumode() ? "\\<Right>" : "\\<Down>"',
	["<Left>"] = 'wildmenumode() ? "\\<Up>"    : "\\<Left>"',
	["<Right>"] = 'wildmenumode() ? "\\<Down>"  : "\\<Right>"',
}
for k, v in pairs(wildmenu_keys) do
	map("c", k, v, { expr = true })
end
