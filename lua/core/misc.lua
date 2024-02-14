vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 8
vim.api.nvim_set_option('encoding', 'utf-8')

-- :Spaces -- 
-- Provide 0-2 arguments:
-- true | false - Whether or not to use spaces
-- int - what size to set tabstop and shiftwidth to
vim.api.nvim_create_user_command('Spaces',
  function(opts)
    local expandtab;
    local tabstop;
    local shiftwidth;
    local args = {};
    for word in opts['args']:gmatch('%S+') do
      table.insert(args, word)
    end
    local firstarglow = args[1] and args[1]:lower()

    if firstarglow == 'true' or firstarglow == 'false' then
      expandtab = args[1] == 'true';
      tabstop = tonumber(args[2]) or 4;
      shiftwidth = tabstop;
    else
      expandtab = (args[2] and args[2]:lower() == 'false') and false or true;

      tabstop = tonumber(args[1]) or 4;
      shiftwidth = tabstop;
    end
    vim.opt.expandtab = expandtab;
    vim.opt.tabstop = tabstop;
    vim.opt.shiftwidth = shiftwidth;
    print(string.format("Tabstop: %d, Shiftwidth: %d, Expandtab: %s", tabstop, shiftwidth, expandtab));
  end,
  {  nargs = '?',  }
)


