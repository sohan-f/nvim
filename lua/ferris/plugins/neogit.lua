return {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
			{ "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit commit" },
			{ "<leader>gp", "<cmd>Neogit push<CR>", desc = "Neogit push" },
			{ "<leader>gl", "<cmd>Neogit pull<CR>", desc = "Neogit pull" },
			{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
			{ "<leader>gD", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "Diffview last commit" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
			{ "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Branch history" },
			{ "<leader>gx", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
		},
		opts = {
			integrations = {
				diffview = true,
				telescope = true,
			},
			-- Signs in the status buffer
			signs = {
				hunk = { "", "" },
				item = { "", "" },
				section = { "", "" },
			},
			graph_style = "unicode",
			git_services = {
				["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
				["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/create?merge_request[source_branch]=${branch_name}",
			},
			-- Open diffview instead of default split for diffs
			commit_editor = {
				kind = "split",
			},
			commit_select_view = {
				kind = "split",
			},
			log_view = {
				kind = "split",
			},
			rebase_editor = {
				kind = "split",
			},
			reflog_view = {
				kind = "split",
			},
			merge_editor = {
				kind = "split",
			},
			sections = {
				recent_commits = {
					folded = false,
					hidden = false,
				},
				untracked_files = {
					folded = false,
					hidden = false,
				},
				unstaged = {
					folded = false,
					hidden = false,
				},
				staged = {
					folded = false,
					hidden = false,
				},
				stashes = {
					folded = true,
				},
				unpulled_upstream = {
					folded = true,
				},
				unmerged_upstream = {
					folded = false,
				},
			},
		},
	},
}
