require('code.execute_module')

compile_execute_c_project = function()
    local ui = vim.api.nvim_list_uis()[1]
    local compile_window_width = math.floor(ui['width'] * 0.70)
    local compile_window_height = math.floor(ui['height'] * 0.35)

    local compile_window_opts = {
        cwd = vim.lsp.get_clients()[1]['config']['root_dir'],
        cmd = { 'make' },
        width = compile_window_width,
        height = compile_window_height,
        x = math.floor((ui['width'] - compile_window_width) / 2),
        y = 2,
    }
    local execute_window_opts = {
        cwd = compile_window_opts.cwd,
        cmd = { 'make', 'run' },
        width = compile_window_width,
        height = math.floor(compile_window_height * 1.5),
        x = compile_window_opts.x,
        y = 3 + compile_window_height,
    }

    Execute_open_window(compile_window_opts)
    Execute_open_window(execute_window_opts)
    Execute_windows()
end

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = {'*.c', '*.h'},
    callback = function(_)
        vim.cmd [[ command! Execute execute 'lua compile_execute_c_project()' ]]
        vim.api.nvim_set_keymap('n', 'mc', '<cmd>lua vim.system({"make", "clean"}, {cwd = vim.lsp.get_clients()[1]["config"]["root_dir"]})<cr>', {})
    end
})
