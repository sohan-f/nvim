return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer (toggle)" },
		{ "<leader>E", "<cmd>Neotree focus<cr>", desc = "Explorer (focus)" },
		{ "<leader>ge", "<cmd>Neotree git_status<cr>", desc = "Git Explorer" },
	},
	opts = {
		window = {
			position = "left",
			width = 24,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		default_component_configs = {
			indent = { with_expanders = true },
		},
	},
}
