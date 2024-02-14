vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 8
vim.api.nvim_set_option('encoding', 'utf-8')


function setSpaces(opts, universal)
  local target = universal and vim.opt or vim.bo;
  local args = {};
  for word in opts['args']:gmatch('%S+') do
    table.insert(args, word)
  end
  local firstarglow = args[1] and args[1]:lower()

  if firstarglow == 'true' or firstarglow == 'false' then
    expandtab = args[1] == 'true';
    size = tonumber(args[2]) or 4;
  else
    expandtab = (args[2] and args[2]:lower() == 'false') and false or true;

    size = tonumber(args[1]) or 4;
  end
  target.expandtab = expandtab;
  target.tabstop = size;
  target.shiftwidth = size;
  print(string.format("Tabstop: %d, Shiftwidth: %d, Expandtab: %s", size, size, expandtab));
end


-- :Spaces -- 
-- Set settings regarding spaces in the current buffer.
-- Provide 0-2 arguments:
-- true | false - Whether or not to use spaces
-- int - what size to set tabstop and shiftwidth to
vim.api.nvim_create_user_command('Spaces',
  function(opts)
    setSpaces(opts, false);
  end,
  {  nargs = '?',  }
)

-- :Spacesg -- 
-- Set settings regarding spaces in all buffers where it hasn't been changed.
-- Provide 0-2 arguments:
-- true | false - Whether or not to use spaces
-- int - what size to set tabstop and shiftwidth to
vim.api.nvim_create_user_command('Spacesg',
  function(opts)
    setSpaces(opts, true);
  end,
  {  nargs = '?',  }
)

