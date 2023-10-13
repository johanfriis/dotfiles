version = "0.21.3"

xplr.config.layouts.custom.minimal = {
  Vertical = {
    config = {
      constraints = {
        { Min = 1 },
        { Length = 3 },
      },
    },
    splits = {
      "Table",
      "InputAndLogs",
    },
  },
}
xplr.config.general.initial_layout = "minimal"

-- -- xplr.config.general.default_ui.prefix = ""
-- -- xplr.config.general.default_ui.suffix= ""

-- xplr.config.general.panel_ui.default.title.format = nil
-- xplr.config.general.panel_ui.default.borders = nil
-- xplr.config.general.panel_ui.table.title.format = nil

-- -- xplr.fn.custom.fmt_simple_column = function(m)
-- --   return m.prefix .. m.relative_path .. m.suffix
-- -- end

xplr.config.general.table.header.cols = {
  { format = "" }
}

xplr.config.general.table.row.cols = {
  { format = "builtin.fmt_general_table_row_cols_1", style = {}}
}

xplr.config.general.table.col_widths = {
  { Percentage = 100 }
}