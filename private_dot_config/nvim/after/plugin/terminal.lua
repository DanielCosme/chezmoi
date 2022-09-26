require("toggleterm").setup {
    open_mapping = [[<C-h>]],
    insert_mappings = true,
    shade_terminals = false,
    shell = 'fish',
    direction = 'float',
    -- persist_size = true,
    -- persist_mode = true,
    float_opts = {
        border = 'curved'
    }
}
