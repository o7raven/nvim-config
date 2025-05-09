local lualine = require('lualine')

-- Custom macro recording indicator
local function macro_status()
  local reg = vim.fn.reg_recording()
  if reg == '' then return '' end
  return 'Recording @' .. reg
end

lualine.setup {
  options = {
    theme = 'jellybeans',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        sections = {'error', 'warn', 'info', 'hint'},
        symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'},
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
      'filename',
    },
    lualine_x = {macro_status},
    lualine_y = {'filetype'},
    lualine_z = {'location'},
  },
}

