require("copilot").setup({
    panel = { enabled = false },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 10,
        keymap = {
            accept = "<M-CR>",
            accept_word = "<M-w>",
            accept_line = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        filetypes = {
            ["."] = false,
        }
    },
    copilot_node_command = 'node'
})
