version = "0.21.3"

xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      margin = 1,
      horizontal_margin = 1,
      vertical_margin = 1,
      constraints = {
        { Percentage = 100 },
      }
    },
    splits = {
      "Table",
    }
  }
}

-- xplr.config.general.default_ui.prefix = ""
-- xplr.config.general.default_ui.suffix= ""

xplr.config.general.panel_ui.default.title.format = nil
xplr.config.general.panel_ui.default.borders = nil
xplr.config.general.panel_ui.table.title.format = nil

-- xplr.fn.custom.fmt_simple_column = function(m)
--   return m.prefix .. m.relative_path .. m.suffix
-- end

xplr.config.general.table.header.cols = {
  { format = "" }
}

-- xplr.config.general.table.row.cols = {
--   { format = "custom.fmt_simple_column" }
-- }
xplr.config.general.table.row.cols = {
  { format = "builtin.fmt_general_table_row_cols_1", style = {}}
}

xplr.config.general.table.col_widths = {
  { Percentage = 100 }
}