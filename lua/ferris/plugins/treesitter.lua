return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"diff",
			"html",
			"javascript",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"xml",
			"yaml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "bash", "diff", "html", "javascript", "regex", "toml", "tsx", "typescript", "xml", "yaml" },
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
