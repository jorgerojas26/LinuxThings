local actions = require('telescope.actions')


require('telescope').setup{
	defaults = {
		mappings = {
		  i = {
			["<esc>"] = actions.close
		  },
		},
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
	file_ignore_patterns = { "node%_modules/.*", "%.chunk", "%.log" },
	extensions = {
		'session-lens',
		'project'
	}
  }
}


