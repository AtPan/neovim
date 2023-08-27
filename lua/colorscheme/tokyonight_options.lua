local tokyonight_status, tokyonight = pcall(require, 'tokyonight')

if not tokyonight_status then
    return
end

tokyonight.setup({
    style = "moon",
    terminal_colors = false,
    styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
})

local lualine_status, lualine = pcall(require, 'lualine')

if lualine_status then
    lualine.setup({
        options = {
            theme = 'tokyonight',
        }
    })
end

vim.cmd [[colorscheme tokyonight]]
