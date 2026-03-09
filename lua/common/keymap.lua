local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- #############
-- ## General ##
-- #############
keymap("n", "s", "<C-w>", opts)

-- HOME / END
keymap("n", "<S-l>", "$", opts)
keymap("v", "<S-l>", "$", opts)
keymap("n", "<S-h>", "^", opts)
keymap("v", "<S-h>", "^", opts)

-- Word unit move
keymap("n", "<C-l>", "e", opts)
keymap("v", "<C-l>", "e", opts)
keymap("n", "<C-h>", "b", opts)
keymap("v", "<C-h>", "b", opts)
keymap("n", "<C-L>", "E", opts)
keymap("v", "<C-L>", "E", opts)
keymap("n", "<C-H>", "B", opts)
keymap("v", "<C-H>", "B", opts)

-- Page scroll
keymap("n", "<C-k>", "<C-u>", opts)
keymap("v", "<C-k>", "<C-u>", opts)
keymap("n", "<C-j>", "<C-d>", opts)
keymap("v", "<C-j>", "<C-d>", opts)

-- Terminal
keymap("t", "<C-n>", "<C-W>N", opts)

-- Disable
keymap("n", "Q", "<Nop>", opts)
keymap("n", "<S-j>", "<Nop>", opts)
keymap("n", "<S-k>", "<Nop>", opts)

-- 検索ハイライト解除（VSCode の Escape 的な動作）
keymap("n", "<Esc>", "<Cmd>nohlsearch<CR>", opts)

-- #############
-- ## Neo-tree ##
-- #############
keymap("n", "q", "<Cmd>Neotree toggle<CR>", opts)
-- カレントファイルをツリーで reveal（VSCode の「エクスプローラーで表示」）
keymap("n", "<leader>e", "<Cmd>Neotree reveal<CR>", opts)

-- ###############
-- ## Telescope ##
-- ###############
-- Ctrl+P: ファイル検索（VSCode の Ctrl+P と同じ）
keymap("n", "<C-p>", "<Cmd>Telescope find_files<CR>", opts)
-- Ctrl+Shift+F: 文字列検索（VSCode の Ctrl+Shift+F と同じ）
keymap("n", "<leader>f", "<Cmd>Telescope live_grep<CR>", opts)
-- Ctrl+Shift+P: コマンドパレット風
keymap("n", "<leader>P", "<Cmd>Telescope commands<CR>", opts)
keymap("n", "<leader>d", "<Cmd>Telescope diagnostics<CR>", opts)

-- ############
-- ## Barbar ##
-- ############
-- Move to previous/next
keymap("n", "s,", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "s.", "<Cmd>BufferNext<CR>", opts)

-- Re-order
keymap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer by position
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin
keymap("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer（VSCode の Ctrl+W）
keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

-- Sort
keymap("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
keymap("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
keymap("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
keymap("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
keymap("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- #########
-- ## LSP ##
-- #########
-- VSCode の F12 / Ctrl+クリック系
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "定義へジャンプ" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "参照一覧" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "実装へジャンプ" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "ホバードキュメント" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "リネーム" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "コードアクション" })
-- 診断ナビゲーション
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "前のエラーへ" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "次のエラーへ" })
-- フォーマット（VSCode の Alt+Shift+F）
vim.keymap.set("n", "<A-S-f>", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "フォーマット" })
vim.keymap.set("v", "<A-S-f>", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "選択範囲フォーマット" })

-- ##########
-- ## dial ##
-- ##########
vim.keymap.set("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("v", "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("v", "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("v", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("v", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gvisual")
end)
