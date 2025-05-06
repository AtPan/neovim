local tables = {}

--[[
Takes the following table as arguments:
* cmd [table]: The command to run and show
* cwd [string]: The directory to run the command in
* channel [string|nil]: 
* width [int]: The width of the window
* height [int]: The height of the window
* x [int]: The x coordinate of the upper-left corner of the window
* y [int]: The y coordinate of the upper-left corner of the window
]]--
Execute_open_window = function(opts)
    if (not type(opts) == "table") or opts.cwd == nil or opts.cmd == nil then return { winnr = nil, bufnr = nil } end
    if opts.width == nil then opts.width = 1 end
    if opts.height == nil then opts.width = 1 end
    if opts.x == nil then opts.x = 0 end
    if opts.y == nil then opts.y = 0 end

    --[[
    for _, t in ipairs(tables) do
        if t.cmd == opts.cmd then
            if type(t.channel) == "string" and type(opts.channel) == "string" and not t.channel == opts.channel then
                t.channel = { t.channel = true, opts.channel = true }
            end
        end
    end
    ]]--

    if opts.channel == nil then opts.channel = { stdout = true, stderr = true } end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_create_autocmd('BufEnter', { 
        buffer = buf,
        callback = function(_)
            vim.api.nvim_buf_set_keymap(buf, 'n', '<leader><ESC>', '<cmd>lua Execute_close_windows()<cr>', { noremap = true, silent = true })
        end,
    })
    vim.api.nvim_create_autocmd('BufDelete', {
        buffer = buf,
        callback = function(_)
            Execute_close_windows()
        end,
    })

    local window_opts = {
        relative = 'editor',
        col = opts.x,
        row = opts.y,
        width = opts.width,
        height = opts.height,
        border = 'rounded',
        style = 'minimal',
    }
    tables[#tables + 1] = { 
        winnr = vim.api.nvim_open_win(buf, 1, window_opts),
        bufnr = buf,
        cwd = opts.cwd,
        cmd = opts.cmd,
        channel = opts.channel,
        callback = opts.callback,
    }
end

Execute_append_cmd_window = function(window)
    if not window then return end

    local bufnr = window.bufnr
    local start_line = vim.api.nvim_win_get_cursor(window.winnr)[1] - 1

    local append_text_func = vim.schedule_wrap(function(_, line)
        if not line then return end
        vim.bo[bufnr].modifiable = true

        for str in string.gmatch(line, '[^\n]+') do
            vim.api.nvim_buf_set_lines(bufnr, start_line, start_line, false, {str})
            start_line = start_line + 1
        end

        vim.bo[bufnr].modifiable = false
        vim.bo[bufnr].modified = false
    end)

    local stdout = nil;
    local stderr = nil;

    if window.channel.stdout then
        if window.callback then
            stdout = window.callback
        else
            stdout = append_text_func
        end
    end

    if window.channel.stderr then
        if window.callback then
            stderr = window.callback
        else
            stderr = append_text_func
        end
    end

    vim.system(window.cmd, {
        cwd = window.cwd,
        stdout = stdout,
        stderr = stderr,
        text = true,
    }):wait()

end

Execute_windows = function()
    for i=1, #tables do
        local sys = Execute_append_cmd_window(tables[i])
    end
end

Execute_close_windows = function()
    for _, t in ipairs(tables) do
        vim.api.nvim_win_close(t.winnr, true)
    end
    tables = {}
end
