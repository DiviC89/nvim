return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"gopls",
		},
	},
	"neovim/nvim-lspconfig",
	config = function()
		require "custom.configs.lspconfig"
	end
}
