require'lualine'.setup{
	tabline = {
	  lualine_a = {{'filename', path = 1}},
	  lualine_y = {'diagnostics'},
	  lualine_z = {'tabs'}
	},
	options = {
		theme = 'codedark',
	},
	extensions = {
		'toggleterm'
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_lsp', 'coc'}}},
	    lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'location'},
		lualine_z = {'g:coc_status'}
  },
}

