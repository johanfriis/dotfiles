local Utils = require("utils")

-- better up/down
Utils.map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Utils.map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
