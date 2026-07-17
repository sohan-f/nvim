return {
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewFileHistory",
		},
		opts = {
			enhanced_diff_hl = true,
			view = {
				default = {
					layout = "diff2_horizontal",
					winbar_info = true,
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
				},
				file_history = {
					layout = "diff2_horizontal",
				},
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
				},
			},
			hooks = {
				view_opened = function()
					-- Disable diagnostics in diff buffers
					vim.diagnostic.enable(false)
				end,
				view_closed = function()
					vim.diagnostic.enable(true)
				end,
			},
		},
	},
}
