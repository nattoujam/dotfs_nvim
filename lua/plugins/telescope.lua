return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- fzf ネイティブ拡張（高速化）
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      -- ファイルブラウザ拡張
      "nvim-telescope/telescope-file-browser.nvim",
      -- プロジェクト連携
      "ahmedkhalf/project.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
            },
          },
          file_ignore_patterns = {
            "node_modules/",
            ".git/",
            "dist/",
            "build/",
            "__pycache__/",
            "*.pyc",
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- dotfiles も検索
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      -- 拡張ロード
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "file_browser")
      pcall(telescope.load_extension, "projects")
    end,
  },
}
