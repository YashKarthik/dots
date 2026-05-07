local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "python3" },  -- or { "ipython", "--no-autoindent" }
        format = common.bracketed_paste_python,
        block_deviders = { "# %%", "#%%" },
      },
      elixir = {
        command = { "iex", "-S", "mix"},
      }
    },

    repl_filetype = function(bufnr, ft)
      return ft
    end,
    repl_open_cmd = {
      view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
      view.split.rightbelow("%25")  -- cmd_2: open a repl below
    }

  },

  keymaps = {
    toggle_repl_with_cmd_1 = "<space>r1",
    toggle_repl_with_cmd_2 = "<space>r2",
    restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    send_code_block = "<space>sb",
    send_code_block_and_move = "<space>sn",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },

  highlight = {
    italic = true
  },
  ignore_blank_lines = true,
}

vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
