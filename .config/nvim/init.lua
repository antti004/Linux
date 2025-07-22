


-- Global leading key map. Leading key in Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic
vim.opt.number = true                   -- line numbers

local o = vim.opt

--vim.opt.relativenumber = true           -- line numbers relative
o.cursorline = true               -- higlight cursor line
o.wrap = false                    -- dont wrap lines
o.scrolloff = 10                  -- Keep 10 lines above/belo cursor
o.sidescrolloff = 8               -- Keep 8 columns lef/right of cursor

-- Indentation
o.tabstop = 2                     -- Tab width
o.shiftwidth = 2                  -- Ident width
o.softtabstop = 2
o.smartindent = true
o.autoindent = true                -- Copy ident from current line




-- Visuals UI
vim.opt.termguicolors = true            -- 24-bit colors
vim.opt.signcolumn = "yes"              -- Always show sign column 
vim.opt.colorcolumn = "100"             -- Show column at ## characters. (red column, too wide)
vim.opt.showmatch = true                -- Higlight matching brackets
vim.opt.matchtime = 2                   -- How long matching brackets are higlighted
vim.opt.cmdheight = 1                   -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false                -- Dont show mode in command line
vim.opt.pumheight = 10                  -- Popup menu height
vim.opt.pumblend = 10                   -- Popup menu transparency
vim.opt.winblend = 10                    -- Floating window trancparency
vim.opt.conceallevel = 0                -- Dont hide markup
vim.opt.concealcursor = ""              -- Dont hide cursor line markup
vim.opt.lazyredraw = true               -- Dont redraw during macros
vim.opt.synmaxcol = 300                 -- Syntax hightlighting limit


-- UI Themes
--  - monokai
vim.cmd.colorscheme("monokai")
vim.opt.syntax = "enabled"



-- Key mappings
vim.keymap.set("n","<leader>rc",":e ~/.config/nvim/init.lua<CR>",{ desc = "Edit config" })


-- Include floating_terminal.lua
require("float-term")
