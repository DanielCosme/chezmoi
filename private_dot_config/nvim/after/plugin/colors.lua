-- Tokyo Night
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Capppuccin
-- vim.g.catppuccin_flavour = "latte"
-- vim.g.catppuccin_flavour = "frappe"
-- vim.g.catppuccin_flavour = "mocha"
vim.g.catppuccin_flavour = "macchiato"

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- One Dark
require('onedark').setup {
    style = 'warmer' -- dark, darker, cool, deep, warm, warmer, light
}

-- Color
-- vim.cmd("colorscheme everblush")
-- vim.cmd("colorscheme nordfox") -- nightfox, carbonfox, terafox, nordfox, duskfox, dawnfox, dayfox
vim.cmd("colorscheme carbonfox") -- nightfox, carbonfox, terafox, nordfox, duskfox, dawnfox, dayfox


require('rose-pine').setup({
    dark_variant = 'moon' -- main, moon
})
