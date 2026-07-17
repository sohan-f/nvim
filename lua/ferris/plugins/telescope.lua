return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = "Telescope",
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = { prompt_position = "top" },
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local actions = require("telescope.actions")
		opts.defaults.mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous, -- not "prev"
				["<esc>"] = actions.close,
			},
		}
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
