local lspsaga_status, lspsaga = pcall(require, 'lspsaga')
if not lspsaga_status then
    return
end

lspsaga.setup({
    lightbulb = {
        enable = false,
        enable_in_insert = false,
    },
})
