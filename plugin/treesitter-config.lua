--require'nvim-treesitter.install'.compilers = { "gcc" }

--[[ local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d538e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
} ]]

require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
    },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  matchup = {
    enable = false,
    include_match_words = true,
  },
  ensure_installed = { "vue", "html", "json", "javascript", "typescript", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "vue", "yaml", "tlaplus" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "org" },
    additional_vim_regex_highlighting = { "org" },
  },
})
