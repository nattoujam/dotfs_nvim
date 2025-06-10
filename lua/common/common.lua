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

