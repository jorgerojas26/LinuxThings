require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0), '--print-width=120'},
            stdin = true,
			cwd = vim.fn.expand('%:p:h')
          }
        end
    },
    vue = {
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0), '--print-width=120'},
            stdin = true,
			cwd = vim.fn.expand('%:p:h')
          }
        end
    },
    -- other formatters ...
  }
})
