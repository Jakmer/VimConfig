return {
  "catppuccin/nvim", 
  lazy = false,
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end
}
