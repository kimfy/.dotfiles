require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cue", "go", "typescript", "javascript", "lua", "hcl", "terraform", "dockerfile", "bash", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  --auto_install = true,

  highlight = {
    enable = true,
  },
}
