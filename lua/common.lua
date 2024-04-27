local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-----key config-----
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

-- tab 
keymap("n", "gh", "gT", opts)
keymap("n", "gl", "gt", opts)

keymap("t", "<C-n>", "<C-W>N", opts)

keymap("n", "Q", "<Nop>", opts)
keymap("n", "<S-j>", "<Nop>", opts)
keymap("n", "<S-k>", "<Nop>", opts)

local options = {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,

  backup = false,
  autoread = true,
  showcmd = true,
  backspace = {"indent", "eol", "start"},
  wrap = false,
  foldmethod = "marker",

  -- Encoding
  fenc = "utf-8",
  encoding = "utf-8",
  fileformat = "unix",

  clipboard = "unnamedplus",

  sidescroll = 2, -- スクロール幅
  sidescrolloff = 8,

  -- Preference
  cmdheight = 2,
  title = true,
  number = true,
  smartindent = true,
  -- cursorline = true,
  showmatch = true,

  -- Search
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  wrapscan = true,
  hlsearch = true,
}

vim.opt.shortmess:append("c")

for k,v in pairs(options) do
  vim.opt[k] = v
end

