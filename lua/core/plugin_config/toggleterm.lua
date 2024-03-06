local opts = {
  open_mapping = '<c-\\><c-\\>',

};
-- Use powershell if on windows
if vim.fn.has('win32') then
  opts.shell = "powershell";
  opts.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Connamd [Console]";
  opts.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait";
  opts.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode";
  opts.shellquote = "";
  opts.shellxquote = "";
end

require('toggleterm').setup(opts);
