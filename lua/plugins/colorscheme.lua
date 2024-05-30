return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("kanagawa")
		vim.cmd.hi("Comment gui=none")
	end,
}
