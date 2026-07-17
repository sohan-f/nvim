return {
	{
		"mrcjkb/rustaceanvim",
		version = "^8",
		ft = { "rust" },
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local codelldb_path = vim.fn.exepath("codelldb")

			local codelldb_cmd, liblldb_path

			if codelldb_path ~= "" then
				-- Derive paths relative to the codelldb binary, e.g.
				-- .../codelldb/extension/adapter/codelldb
				-- .../codelldb/extension/lldb/lib/liblldb.so
				local adapter_dir = vim.fn.fnamemodify(codelldb_path, ":h")
				local extension_dir = vim.fn.fnamemodify(adapter_dir, ":h")

				codelldb_cmd = codelldb_path

				local lib_ext = vim.uv.os_uname().sysname == "Darwin" and "liblldb.dylib" or "liblldb.so"
				local candidates = {
					extension_dir .. "/lldb/lib/" .. lib_ext,
					extension_dir .. "/lldb/bin/" .. lib_ext,
				}

				for _, candidate in ipairs(candidates) do
					if vim.uv.fs_stat(candidate) then
						liblldb_path = candidate
						break
					end
				end
			else
				codelldb_cmd = "codelldb"
			end

			vim.g.rustaceanvim = {
				server = {
					settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
							},
						},
					},
				},

				dap = {
					adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_cmd, liblldb_path),
				},
			}
		end,
	},
}
