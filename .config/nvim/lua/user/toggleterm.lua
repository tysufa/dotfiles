local direc = "horizontal"
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  direction = direc,
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.45
    end
  end,
  open_mapping = [[<c-d>]],

  -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
  on_open = function() -- function to run when the terminal opens this function save what you were doing but only work with horizontal term
      if direc =="horizontal" then
          vim.cmd("wincmd k") -- go to the window upwards
          vim.cmd("write") -- save file
          vim.cmd("wincmd j") -- go back to term
          -- vim.cmd("call feedkeys('i')") -- send the key i 
          vim.cmd("normal i") -- send the key i 
      end
  end,

  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
  -- hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  insert_mappings = true,
  terminal_mappings = true,
}
