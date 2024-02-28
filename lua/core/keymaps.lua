vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = false

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader>b', ':ls<CR>:b'); -- Show buffers
-- vim.keymap.set({'n', 'v'}, '<Leader>v', ':let @x=@" | let @"=@a | let @a=@b | let @b=@x<CR>');

local KeyBufferState = 1; -- 1..3 - ", a, b
local KeyBufferStates = { '@\\"  @a @b', '@a  @b @\\"', '@b  @\\" @a' };
function CycleBuffers(amount)
	local command;
	if amount < 0 then
		command = ':let @x=@b | let @b=@a | let @a=@" | let @"=@x';
	else
		command = ':let @x=@" | let @"=@a | let @a=@b | let @b=@x';
	end
	for _ = 1, math.abs(amount), 1 do
		vim.cmd(command);
	end
	KeyBufferState = ((KeyBufferState - 1 + amount) % 3) + 1;
	vim.cmd('echo "' .. KeyBufferStates[KeyBufferState] .. '"');
end

vim.keymap.set({'n', 'v'}, '<Leader>v', function() CycleBuffers( 1) end, { noremap= true });
vim.keymap.set({'n', 'v'}, '<Leader>V', function() CycleBuffers(-1) end);

