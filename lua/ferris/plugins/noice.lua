return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		-- Let fidget.nvim handle LSP progress, disable here
		lsp = {
			progress = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
				},
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true, -- nicer hover doc UX
		},
		-- Route noisy messages away from cmdline
		routes = {
			-- Send large outputs to split instead of popup
			{
				filter = { event = "msg_show", min_height = 10 },
				view = "split",
			},
			-- Suppress common noise
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" }, -- written X lines
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
						{ find = "%d+ fewer lines" },
						{ find = "%d+ more lines" },
						{ find = "^%-%-No%-%-" }, -- no more items
					},
				},
				opts = { skip = true },
			},
			-- Search count to mini instead of cmdline
			{
				filter = { event = "msg_show", kind = "search_count" },
				opts = { skip = true },
			},
		},
		-- Fine-tune views
		views = {
			cmdline_popup = {
				position = { row = "40%", col = "50%" },
				size = { width = 60, height = "auto" },
			},
			popupmenu = {
				relative = "editor",
				position = { row = "40%", col = "50%" },
				size = { width = 60, height = 10 },
				border = { style = "rounded", padding = { 0, 1 } },
			},
		},
	},
}
