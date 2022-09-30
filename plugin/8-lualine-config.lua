local navic = require("nvim-navic")

local function cwd()
    -- GET directory name
    local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return string.upper(dir)
end

require'lualine'.setup{
    tabline = {
        lualine_a = {cwd},
        lualine_b = {{'filename', path = 1}},
        lualine_c = {{navic.get_location, cond = navic.is_available}},
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

