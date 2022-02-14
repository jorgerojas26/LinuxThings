require'lualine'.setup{
	tabline = {
	  lualine_a = {{'filename', path = 1}},
	  lualine_y = {'diagnostics'},
	  lualine_z = {'tabs'}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_diagnostic', 'coc'}}},
	    lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'location'},
		lualine_z = {'hostname'}
  },
}

