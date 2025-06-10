return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- インストールする言語
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "json",
          "yaml",
          "toml",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "python",
          "nim",
          "ruby",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
          },
        },
        autotag = { enable = true },
      })
    end,
  }
}
