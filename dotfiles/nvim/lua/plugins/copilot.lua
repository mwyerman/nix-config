return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  enabled = false,
  cond = not vim.g.vscode,
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<S-Tab>",
          accept_word = "<C-l>",
          accept_line = "<M-l>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<S-Esc>",
        },
      },
      filetypes = {
        ["*"] = true,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end
}
