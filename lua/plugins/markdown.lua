return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_browser = "" -- puste = domyślna przeglądarka

      vim.keymap.set("n", "<leader>mp", function()
        vim.cmd("MarkdownPreviewToggle")
      end, { noremap = true, silent = true, desc = "Toggle Markdown Preview" })
    end,
  }
}
