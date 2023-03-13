local Utils = require('user.utils')

local hexa = '0123456789abcdef'

return {
  {
    'jakewvincent/mkdnflow.nvim',
    opts = {
      modules = {
        bib = false,
      },
      perspective = {
        priority = 'root',
        root_tell = '.git',
        fallback = 'current',
      },
      links = {
        style = 'wiki',
        conceal = true,
        implicit_extension = 'md',
        transform_explicit = function(_)
          return Utils.random_string(6, hexa)
        end,
        transform_implicit = function(text)
          print(text)
          return text
        end,
      },
    },
  },
}
