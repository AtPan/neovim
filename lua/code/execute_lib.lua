local create_floating_window = function(upper_left_x, upper_left_y, width, height)
    local buf = vim.api.nvim_create_buf(false, true)
    local opts = {
        relative = 'editor',
        col = upper_left_x,
        row = upper_left_y,
        width = width,
        height = height,
        border = 'rounded',
        style = 'minimal',
    }
    return { winnr = vim.api.nvim_open_win(buf, 1, opts), bufnr = buf }
end

local append_cmd_output_to_window = function(winnr, cmd, opts)
    local append_text = function(err, line)
        if not line then return end

        local bufnr = vim.api.nvim_win_get_buf(winnr)
        local start_line = vim.api.nvim_win_get_cursor(winnr)[1] - 1
        vim.bo[bufnr].modifiable = true

        for str in string.gmatch(line, '[^\n]+') do
            vim.api.nvim_buf_set_lines(bufnr, start_line, start_line, false, {str})
            start_line = start_line + 1
        end

        vim.bo[bufnr].modified = false
        vim.bo[bufnr].modifiable = false
    end

    opts['stdout'] = vim.schedule_wrap(append_text)
    opts['stderr'] = vim.schedule_wrap(append_text)
    vim.system(cmd, opts)
end
