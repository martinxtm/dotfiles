-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- --------------------
-- Core settings
-- --------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 2
vim.opt.statusline = "%f"
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- --------------------
-- Bootstrap lazy.nvim
-- --------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- --------------------
-- Plugins
-- --------------------
require("lazy").setup({
  { "christoomey/vim-tmux-navigator" },

  { "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  { "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
    end,
  },

  { "tpope/vim-fugitive" },

  { "jpalardy/vim-slime" },

  { "benmills/vimux" },

  { "nightsense/cosmic_latte" },
})

-- --------------------
-- Colorscheme
-- --------------------
vim.opt.background = "dark"
vim.cmd("colorscheme cosmic_latte")

-- --------------------
-- Keymaps
-- --------------------
vim.keymap.set("v", "<C-d>", "\"_d")
vim.keymap.set("v", "<C-p>", "\"_dP")
vim.keymap.set("v", "//", "y/<C-R>\"<CR>")

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>", { silent = true })

-- --------------------
-- Filetype overrides
-- --------------------
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hql",
  callback = function()
    vim.bo.filetype = "sql"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.siddhi",
  callback = function()
    vim.bo.filetype = "sql"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Quit if file tree is the only window left
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local wins = vim.fn.winnr("$")
    local bufname = vim.api.nvim_buf_get_name(0)
    if wins == 1 and bufname:match("NvimTree_") then
      vim.cmd("quit")
    end
  end,
})

-- --------------------
-- Commands
-- --------------------
vim.api.nvim_create_user_command("JQ", "%!python3 -m json.tool", {})
vim.api.nvim_create_user_command("NE", "NvimTreeToggle", {})

-- --------------------
-- vim-slime
-- --------------------
vim.g.slime_target = "tmux"
vim.g.slime_paste_file = vim.fn.tempname()
vim.g.slime_default_config = {
  socket_name = "default",
  target_pane = "{right-of}",
}
vim.g.slime_dont_ask_default = 1
