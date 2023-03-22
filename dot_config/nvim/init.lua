if vim.g.vscode then
  require('user.config.options')
else
  require('user.config.options')
  require('user.lazy')
  require('user.config.keymap')
end
