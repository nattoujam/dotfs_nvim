return {
  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "jellybeans",
          section_separators = { left = "", right = "" },
          component_separators = { left = "|", right = "|" },
          globalstatus = true, -- ウィンドウ分割時も1本のステータスライン
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } }, -- 相対パス表示
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- ファイルツリー（VSCode の Explorer）
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- 最後のウィンドウなら自動で閉じる
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = "none", -- leader との干渉を避ける
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false, -- dotfiles を表示
            hide_gitignored = true,
          },
        },
      })
    end,
  },

  -- ウィンドウピッカー
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
      })
    end,
  },

  -- インデントガイド（VSCode 風）
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = { enable = true },
        indent = {
          enable = true,
          chars = { "┊" },
        },
      })
    end,
  },

  -- タブバー（VSCode 風）
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      require("barbar").setup({
        animation = false,
        icons = {
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true },
            [vim.diagnostic.severity.WARN] = { enabled = true },
          },
        },
      })
    end,
  },

  -- キーマップヘルプ
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      require("which-key").setup()
    end,
  },

  -- コメントトグル
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<Leader>/",
          block = "<Leader>b",
        },
        opleader = {
          line = "<Leader>/",
          block = "<Leader>b",
        },
        mappings = {
          basic = true,
          extra = false,
        },
      })
    end,
  },

  -- Git サイン（VSCode の gutter アイコン）
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          -- ハンク操作
          map("n", "]c", gs.next_hunk, { desc = "次の変更" })
          map("n", "[c", gs.prev_hunk, { desc = "前の変更" })
          map("n", "<leader>hs", gs.stage_hunk, { desc = "ハンクをステージ" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "ハンクをリセット" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "ハンクをプレビュー" })
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "行の blame" })
          map("n", "<leader>hd", gs.diffthis, { desc = "差分表示" })
        end,
      })
    end,
  },

  -- プロジェクト管理
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "package.json", "go.mod", "pyproject.toml", "*.nimble" },
      })
    end,
  },

  -- 数値インクリメント拡張
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.semver.alias.semver,
        },
      })
    end,
  },

  -- 括弧の自動補完（VSCode デフォルト動作）
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true, -- treesitter と連携
      })
      -- cmp と連携
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- サラウンド操作（VSCode の Emmet 的な囲み操作）
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- カラーコードのプレビュー
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = { "css", "html", "javascript", "typescript", "tsx", "lua" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = false,
          css = true,
          mode = "background",
        },
      })
    end,
  },

  -- 通知UI（VSCode 風のポップアップ通知）
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        render = "compact",
        stages = "fade",
        timeout = 3000,
      })
      vim.notify = require("notify")
    end,
  },

  -- より良い UI（コマンドラインや入力をポップアップ化）
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
        },
      })
    end,
  },

  -- Todo コメントのハイライト（VSCode 拡張相当）
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("todo-comments").setup()
    end,
  },
}