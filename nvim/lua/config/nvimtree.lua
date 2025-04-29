require("nvim-tree").setup({
    view = {
      width = 30,
      side = "left",
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
          },
        },
      },
    },
  })
