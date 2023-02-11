return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
          -- load the colorscheme here
          vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
           require("lualine").setup({
             sections = {
               lualine_x = {
                 {
                   require("lazy.status").updates,
                   cond = require("lazy.status").has_updates,
                   color = { fg = "#ff9e64" },
                 },
               },
             },
           })
        end,
     },
     {
        "nvim-tree/nvim-tree.lua",
        keys = {
          { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
          require("nvim-tree").setup()
        end,
      },
      "scrooloose/nerdcommenter", 
}