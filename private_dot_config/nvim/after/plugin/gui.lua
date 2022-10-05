-- vim.opt.guifont = { "Source Code Pro", ":h12" }

vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "FiraCode Nerd Font"
vim.g.gui_font_default_size = 11

-- vim.g.gui_font_face = "InconsolataGo_Nerd_Font"
-- vim.g.gui_font_default_size = 13

vim.g.neovide_transparency = 0.99
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.2
vim.g.neovide_cursor_vfx_mode = "pixiedust" -- torpedo, railgun 
vim.g.neovide_remember_window_size = true

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-0>", function() ResetGuiFont() end, opts)
