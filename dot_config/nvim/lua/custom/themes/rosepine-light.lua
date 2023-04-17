-- credits to original theme https://rosepinetheme.com/
-- this is a modified version of it

local M = {}

--                    NIGHT         DAWN
-- nc =             '#16141f' ->  '#f8f0e7',
-- base =           '#191724' ->  '#faf4ed',
-- surface =        '#1f1d2e' ->  '#fffaf3',
-- overlay =        '#26233a' ->  '#f2e9e1',
-- muted =          '#6e6a86' ->  '#9893a5',
-- subtle =         '#908caa' ->  '#797593',
-- text =           '#e0def4' ->  '#575279',
-- love =           '#eb6f92' ->  '#b4637a',
-- gold =           '#f6c177' ->  '#ea9d34',
-- rose =           '#ebbcba' ->  '#d7827e',
-- pine =           '#31748f' ->  '#286983',
-- foam =           '#9ccfd8' ->  '#56949f',
-- iris =           '#c4a7e7' ->  '#907aa9',
-- highlight_low =  '#21202e' ->  '#f4ede8',
-- highlight_med =  '#403d52' ->  '#dfdad9',
-- highlight_high = '#524f67' ->  '#cecacd',
-- none = 'NONE',

M.base_30 = {
  black =           '#faf4ed',        -- '#191724',--  nvim bg
  darker_black =    '#13111e',        -- '#13111e',
  white =           '#575279',        -- '#e0def4',
  black2 =          '#fffaf3',        -- '#1f1d2a',
  one_bg =          '#f2e9e1',        -- '#262431',
  one_bg2 =         '#e9e2e1',        -- '#2d2b38',
  one_bg3 =         '#353340',        -- '#353340',
  grey =            '#cecacd',        -- '#3f3d4a',
  grey_fg =         '#474552',        -- '#474552',
  grey_fg2 =        '#514f5c',        -- '#514f5c',
  light_grey =      '#5d5b68',        -- '#5d5b68',
  red =             '#b4637a',        -- '#b4637a',
  baby_pink =       '#f5799c',        -- '#f5799c',
  pink =            '#ff83a6',        -- '#ff83a6',
  line =            '#f2e9e1',        -- '#2e2c39',-- for lines like vertsplit
  green =           '#56949f',        -- '#ABE9B3',
  vibrant_green =   '#56949f',        -- '#b5f3bd',
  nord_blue =       '#86b9c2',        -- '#86b9c2',
  blue =            '#8bbec7',        -- '#8bbec7',
  yellow =          '#f6c177',        -- '#f6c177',
  sun =             '#fec97f',        -- '#fec97f',
  purple =          '#907aa9',        -- '#c4a7e7',
  dark_purple =     '#bb9ede',        -- '#bb9ede',
  teal =            '#6aadc8',        -- '#6aadc8',
  orange =          '#f6c177',        -- '#f6c177',
  cyan =            '#a3d6df',        -- '#a3d6df',
  statusline_bg =   '#faf4ec',        -- '#201e2b',
  lightbg =         '#efe9e4',        -- '#2d2b38',
  pmenu_bg =        '#c4a7e7',        -- '#c4a7e7',
  folder_bg =       '#6aadc8',        -- '#6aadc8',
}

M.base_16 = {
  base00 = '#faf4ec',
  base01 = '#fffaf3',
  base02 = '#f2e9e1',
  base03 = '#9893a5',
  base04 = '#797593',
  base05 = '#575279',
  base06 = '#575279',
  base07 = '#cecacd',
  base08 = '#b4637a',
  base09 = '#ea9d34',
  base0A = '#d7827e',
  base0B = '#286983',
  base0C = '#56949f',
  base0D = '#907aa9',
  base0E = '#ea9d34',
  base0F = '#cecacd',
}

M = require("base46").override_theme(M, "rosepine_light")

M.type = "light"

return M

