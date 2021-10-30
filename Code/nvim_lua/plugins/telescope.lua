local actions = require('telescope.actions')
require('telescope').setup{
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
	mappings = {
		i = {
			["<C-q>"] = actions.send_to_qflist,
		}
	},
	extensions = {
	  fzy_native = {
		  override_generic_sorter = false,
		  override_file_sorter = true,
		}
	}
}

require('telescope').load_extension('fzy_native')
local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Dotfiles >",
		cwd = "$HOME/.config"
	})
end
return M

