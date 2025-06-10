return {
  "j-hui/fidget.nvim",
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- LSP server
        ensure_installed = {
          "lua_ls",
          "nimls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- NimのLSP 設定
      vim.lsp.enable("nimlsp")
      vim.lsp.config("nimlsp", {
        cmd = { "nimlsp" },
        filetypes = { "nim" },
        root_dir = require("lspconfig").util.root_pattern("*.nimble", ".git", "src"),
        capabilities = capabilities,
      })

      -- LuaのLSP設定
      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Neovim は LuaJIT
            },
            diagnostics = {
              globals = { "vim" }, -- `vim` を未定義としない
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
        capabilities = capabilities,
      })

      -- diagnostic 設定（任意）
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- LSP補完
      "hrsh7th/cmp-buffer",     -- バッファ補完
      "hrsh7th/cmp-path",       -- パス補完
      "hrsh7th/cmp-cmdline",    -- コマンドライン補完
      "L3MON4D3/LuaSnip",       -- スニペットエンジン
      "saadparwaiz1/cmp_luasnip", -- LuaSnip との接続
      "rafamadriz/friendly-snippets", -- よく使われるスニペット
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  }
}
