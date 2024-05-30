return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostics_on = "all",
				tsserver_max_memory = "auto",
				complete_function_calls = true,
				code_lens = "all",
				jsx_close_tag = {
					enable = false,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},
		})
		vim.keymap.set(
			"n",
			"<leader>tto",
			"TSToolsOrganizeImports",
			{ desc = "[T]ypescript [T]ools - [O]rganize Imports" }
		)
		vim.keymap.set("n", "<leader>ttsi", "TSToolsSortImports", { desc = "[T]ypescript [T]ools - [S]ort [I]mports" })
		vim.keymap.set(
			"n",
			"<leader>ttri",
			"TSToolsRemoveUnusedImports",
			{ desc = "[T]ypescript [T]ools - [R]emove Unused [I]mports" }
		)
		vim.keymap.set(
			"n",
			"<leader>ttru",
			"TSToolsRemoveUnused",
			{ desc = "[T]ypescript [T]ools - [R]emove [U]nused" }
		)
		vim.keymap.set(
			"n",
			"<leader>tta",
			"TSToolsAddMissingImports",
			{ desc = "[T]ypescript [T]ools - [A]dd Missing Imports" }
		)
		vim.keymap.set("n", "<leader>ttm", "TSToolsFixAll", { desc = "[T]ypescript [T]ools - [M]agic Fix All" })
		vim.keymap.set(
			"n",
			"<leader>ttg",
			"TSToolsGoToSourceDefinition",
			{ desc = "[T]ypescript [T]ools - [G]o To Source Definition" }
		)
		vim.keymap.set("n", "<leader>ttrn", "TSToolsRenameFile", { desc = "[T]ypescript [T]ools - [R]ename [F]ile" })
		vim.keymap.set("n", "<leader>ttf", "TSToolsFileRerence", { desc = "[T]ypescript [T]ools - [F]ile Reference" })
	end,
}
