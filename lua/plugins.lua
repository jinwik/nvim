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
      { "scrooloose/nerdcommenter" },
      { 
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        config = function()
          require("nvim-treesitter.configs").setup{
              ensure_installed = { "vim", "help", "bash", "c", "cpp", "java", "go", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" },
              highlight = { enable = true },
              indent = { enable = true },
              rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil
              }
          }
        end
      },
      {
        "p00f/nvim-ts-rainbow",
        dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "neovim/nvim-lspconfig"
        },
      },
      { "hrsh7th/nvim-cmp" },
      {
        "windwp/nvim-autopairs",
        lazy = false,
        config = function()
          local npairs_ok, npairs = pcall(require, "nvim-autopairs")
          if not npairs_ok then
            return
          end
          npairs.setup {
            check_ts = true,
            ts_config = {
              lua = { "string", "source" },
              javascript = { "string", "template_string" },
            },
            fast_wrap = {
              map = '<M-e>',
              chars = { '{', '[', '(', '"', "'" },
              pattern = [=[[%'%"%)%>%]%)%}%,]]=],
              end_key = '$',
              keys = 'qwertyuiopzxcvbnmasdfghjkl',
              check_comma = true,
              highlight = 'Search',
              highlight_grey='Comment'
            },
          }
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          local cmp_status_ok, cmp = pcall(require, "cmp")
          if not cmp_status_ok then
            return
          end 
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
        end
      }
}
