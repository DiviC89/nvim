return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hs", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		-- Basic keymaps --
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "Append to harpoon" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon item 1" })
		vim.keymap.set("n", "<leader>hj", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon item 2" })
		vim.keymap.set("n", "<leader>hk", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon item 3" })
		vim.keymap.set("n", "<leader>hl", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon item 4" })
		vim.keymap.set("n", "<leader>hc", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon list delete" })
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Previous harpoon item" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Next harpoon item" })
	end,
}
