-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = { { "catppuccin/nvim" }, { "github/copilot.vim" }, {
  "f-person/git-blame.nvim",
  event = "BufRead",
  config = function()
    vim.cmd "highlight default link gitblame SpecialComment"
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_delay = 500
  end
}, {
  "ethanholz/nvim-lastplace",
  event = "BufRead",
  config = function()
    require("nvim-lastplace").setup({
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true
    })
  end
}, {
  "AckslD/swenv.nvim",
  get_envs = function(venvs_path)
    return require('swenv.api').get_envs(venvs_path)
  end,

  venvs_path = vim.fn.expand('~/work/')
}, { "stevearc/dressing.nvim" }, { "shatur/neovim-ayu" } }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact" }
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    name = "eslint",
    filetypes = { "typescript", "typescriptreact" }
  }
}

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" }
}

lvim.colorscheme = "ayu-mirage"
lvim.format_on_save.enabled = true
