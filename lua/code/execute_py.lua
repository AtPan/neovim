require('code.execute_module')

execute_py_project = function()
    local ui = vim.api.nvim_list_uis()[1]
    local window_width = math.floor(ui['width'] * 0.30)
    local window_height = math.floor(ui['height'] * 0.75)

    local cwd = vim.lsp.get_clients()[1]['config']['cmd_cwd']

    local window_opts = {
        cmd = { 'python3', string.gsub(vim.api.nvim_buf_get_name(0), cwd, '.') },
        cwd = cwd,
        width = window_width,
        height = window_height,
        x = math.floor(ui['width'] * 0.70),
        y = 1,
    }

    Execute_open_window(window_opts)
    Execute_windows()
end

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = {'*.py'},
    callback = function(_)
        vim.cmd [[ command! Execute execute 'lua execute_py_project()' ]]
    end
})
