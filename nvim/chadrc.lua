---@type ChadrcConfig 
return {
    ui = {
        theme = 'doomchad',
        transparency = true,
        nvdash = {
            load_on_startup = true,
        }
    },
    plugins = 'custom.plugins',
    mappings = require 'custom.mappings',
}