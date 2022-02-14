require('formatter').setup({
  logging = false,
  filetype = {
    lua = {
       function()
          return {
            exe = "prettier",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true,
			cwd = vim.fn.expand('%:p:h')
          }
        end
    },
    json = {
       function()
          return {
            exe = "prettier",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true,
			cwd = vim.fn.expand('%:p:h')
          }
        end
    },
    javascript = {
       function()
          return {
            exe = "prettier",
            args = {vim.api.nvim_buf_get_name(0), '--print-width=120'},
            stdin = true,
			cwd = vim.fn.expand('%:p:h')
          }
        end
    },
    vue = {
       function()
          return {
            exe = "prettier",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true,
			cwd = vim.fn.expand('%:p:h')
          }
        end
    },
    -- other formatters ...
  }
})
