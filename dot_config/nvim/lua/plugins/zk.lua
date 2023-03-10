return {
  "mickael-menu/zk-nvim",
  config = function()
    require("zk").setup()
    require("telescope").load_extension("zk")
  end
}
