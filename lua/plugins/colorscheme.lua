return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Load the colorscheme here
		vim.cmd.colorscheme("rose-pine")
	end,
}
