-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.wrap = true

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "FiraCode Nerd Font Mono:h14"
  vim.g.neovide_window_blurred = true
  vim.g.neovide_theme = "auto"
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_transparency = 0.8
end
