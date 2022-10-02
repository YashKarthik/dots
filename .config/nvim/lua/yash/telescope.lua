local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "Dots",
        cwd = "~/.config",
        hidden = true,
    })
end

return M
