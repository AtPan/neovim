function CreateNoteWindow()
    --- Create Constants
    local width = 50
    local height = 20

    --- Secure Buffer
    local buf = vim.api.nvim_create_buf(false, false)

    --- Setup Options
    local ui = vim.api.nvim_eval('nvim_list_uis()[0]')
    local opts = {}
    opts.relative = 'editor'
    opts.width = width
    opts.height = height
    opts.col = (ui.width/2) - (width/2)
    opts.row = (ui.height/2) - (height/2)
    opts.anchor = 'NW'
    opts.style = 'minimal'
    opts.border = 'rounded'

    --- Decorate Window Borders
    --[[local horizontal = vim.api.nvim_eval('\'+\'.repeat(\'-\', ' .. width - 2 .. ') . \'+\'')
    local vertical = vim.api.nvim_eval('\'|\'.repeat(\' \', ' .. width - 2 .. ') . \'|\'')
    local border = {}

    table.insert(border, 1, horizontal)
    for i=1,height-2,1
    do
        table.insert(border, #border + 1, vertical)
    end
    table.insert(border, #border + 1, horizontal)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, border)
    --]]

    --- Create Window
    local win = vim.api.nvim_open_win(buf, 1, opts)
    return win
end
