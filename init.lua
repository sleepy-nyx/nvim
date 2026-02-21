vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.scrolloff = 10
vim.g.mapleader = " "

-- COLEMAK
--vim.keymap.set('n', 'k', '<Left>')
--vim.keymap.set('n', 'l', '<Down>')
--vim.keymap.set('n', ';', '<Up>')
--vim.keymap.set('n', '\'', '<Right>')
--vim.keymap.set('n', 'l', '<Insert>')

--vim.keymap.set('n', 'h', 'o')
--vim.keymap.set('n', 'H', 'O')

vim.keymap.set({ 'n', 'v', 'x' }, 'd', '"_d') --this line to cut to null register (aka delete)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', 'd') --this line to actually cut
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)     --format according to lsp

vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'G', 'G0')
vim.keymap.set('n', 'gg', 'gg0')

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  -- { src = "https://github.com/mluders/comfy-line-numbers.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/andweeb/presence.nvim" },
  -- { src = "https://github.com/nvim-lua/plenary.nvim" },
  -- { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2", }
})


require("oil").setup()
-- local harpoon = require("harpoon")
-- harpoon:setup()
-- harpoon = require('plenary')
--
-- vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

vim.keymap.set('n', '<leader>e', ':Oil<CR>')

require "mini.pick".setup()
vim.lsp.enable({ "lua_ls", "html", "cssls", })

vim.lsp.config('*', {
  root_markers = { '.git' },
})

--vim.lsp.config('cssls', { 
--  cmd = { "vscode-css-languageserver", "--stdio" },
--  filetypes = { "css", "scss", "less" },
--  root_dir = function(fname)
--    return root_pattern(fname) or vim.loop.os_homedir()
--  end,
--  settings = {
--    css = {
--      validate = true
--    },
--    less = {
--      validate = true
--    },
--    scss = {
--      validate = true
--    },
--  }
--})

-- vim.api.nvim_create_autocmd("Filetype", {
-- 	pattern = { "html", "shtml", "htm" },
-- 	callback = function()
-- 		vim.lsp.start({
-- 			name = "superhtml",
-- 			cmd = { "superhtml", "lsp" },
-- 			root_dir = vim.fs.dirname(vim.fs.find({".git"}, { upward = true })[1])
-- 		})
-- 	end
-- })

vim.cmd("colorscheme vague")
-- vim.o.autocomplete = true
--
-- autocomplete:
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
vim.cmd("set completeopt+=noselect")


--   _______  __  ____   _______
--  /__  __/ / / /    / / _____/
--    / /   / / / ___/ /____
--   / /   / / / /    _____/ /
--  /_/   /_/ /_/    /______/
--
--  (i made the ascii art myself, don't judge...)
--
-- copy to system clipboard: "+yy
-- read: omnicomplete for autocompletion
-- manual competion: <c>x + <c>o; <c>n to move down suggestion list, <c>p to move up
-- diagnostics: <c>wd
-- toggle comment: gc
