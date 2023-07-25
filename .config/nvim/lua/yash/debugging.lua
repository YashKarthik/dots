local dap, dapui = require("dap"), require("dapui")
dapui.setup()
require('telescope').load_extension('dap')

-- Auto open/close dap ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

--              Languages

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


-- Go
require('dap-go').setup()

-- C, C++, Rust
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/local/opt/llvm/bin/lldb-vscode', -- found using $(brew --prefix llvm)/bin
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
dap.configurations.c = dap.configurations.cpp
