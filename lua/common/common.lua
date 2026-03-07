local options = {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,

  backup = false,
  autoread = true,
  showcmd = true,
  backspace = { "indent", "eol", "start" },
  wrap = false,
  foldmethod = "marker",

  -- Encoding
  fileencoding = "utf-8",
  encoding = "utf-8",
  fileformat = "unix",

  clipboard = "unnamedplus",

  sidescroll = 2,
  sidescrolloff = 8,

  -- Preference
  cmdheight = 2,
  title = true,
  number = true,
  smartindent = true,
  showmatch = true,
  cursorline = true,    -- カーソル行をハイライト（VSCode風）
  signcolumn = "yes",   -- サインカラムを常に表示（診断アイコン用）
  termguicolors = true, -- True color 有効化

  -- Search
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  wrapscan = true,
  hlsearch = true,

  -- Split
  splitbelow = true, -- 水平分割は下に開く（VSCode風）
  splitright = true, -- 垂直分割は右に開く（VSCode風）

  -- Scroll
  scrolloff = 8,

  -- Completion
  completeopt = { "menu", "menuone", "noselect" },

  -- Undo
  undofile = true, -- 永続 undo
  undodir = vim.fn.stdpath("data") .. "/undo",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- undodir が存在しなければ作成
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undo", "p")
