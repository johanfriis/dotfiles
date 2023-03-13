
local header = function()
  local hour = tonumber(vim.fn.strftime('%H'))
  -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
  local part_id = math.floor((hour + 4) / 8) + 1
  local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]
  local username = 'Johan'

  return ('Good %s, %s'):format(day_part, username)
end

return {
  {
    'echasnovski/mini.starter',
    version = false,
    config = function()
      local starter = require('mini.starter')
      starter.setup({
        items = {
          starter.sections.recent_files(4, true),
          function()
            return {
              {
                action = 'Telescope find_files',
                name = 'Files',
                section = 'Actions',
              },
              {
                action = 'Telescope live_grep',
                name = 'Search',
                section = 'Actions',
              },
              {
                action = 'Telescope projects',
                name = 'Projects',
                section = 'Actions',
              },
              {
                action = 'Telescope oldfiles',
                name = 'Old files',
                section = 'Actions',
              },
              {
                name = 'New buffer',
                action = 'enew',
                section = 'Actions',
              },
              {
                name = 'Quit',
                action = 'qall',
                section = 'Actions',
              },
            }
          end,
        },
        footer = '',
      })
    end,
  },
}
