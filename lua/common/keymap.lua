local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- #############
-- ## General ##
-- #############
keymap("n", "s", "<C-w>", opts)

-- HOME and END
keymap("n", "<S-l>", "$", opts)
keymap("v", "<S-l>", "$", opts)
keymap("n", "<S-h>", "^", opts)
keymap("v", "<S-h>", "^", opts)

-- move Word unit
keymap("n", "<C-l>", "e", opts)
keymap("v", "<C-l>", "e", opts)
keymap("n", "<C-h>", "b", opts)
keymap("v", "<C-h>", "b", opts)
keymap("n", "<C-L>", "E", opts)
keymap("v", "<C-L>", "E", opts)
keymap("n", "<C-H>", "B", opts)
keymap("v", "<C-H>", "B", opts)

-- move window unit
keymap("n", "<C-k>", "<C-u>", opts)
keymap("v", "<C-k>", "<C-u>", opts)
keymap("n", "<C-j>", "<C-d>" , opts)
keymap("v", "<C-j>", "<C-d>" , opts)

keymap("t", "<C-n>", "<C-W>N", opts)

keymap("n", "Q", "<Nop>", opts)
keymap("n", "<S-j>", "<Nop>", opts)
keymap("n", "<S-k>", "<Nop>", opts)

-- #############
-- ## Neotree ##
-- #############
keymap("n", "q", "<Cmd>Neotree toggle<CR>", opts)

-- ############
-- ## Barbar ##
-- ############
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
keymap('n', 's,', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', 's.', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
keymap('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
keymap('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

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

