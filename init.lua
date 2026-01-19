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


vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"_y')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"_d<CR>') --this and above line to delete/cut to null register
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)     --format according to lsp

vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'G', 'G0')

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/mluders/comfy-line-numbers.nvim" },
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
vim.lsp.enable({ "lua_ls", "tinymist", "html", "cssls", "rust-analyzer" })

require('comfy-line-numbers').setup({
  labels = {
    '1', '2', '3', '4', '5', '11', '12', '13', '14', '15', '21', '22', '23',
    '24', '25', '31', '32', '33', '34', '35', '41', '42', '43', '44', '45',
    '51', '52', '53', '54', '55', '111', '112', '113', '114', '115', '121',
    '122', '123', '124', '125', '131', '132', '133', '134', '135', '141',
    '142', '143', '144', '145', '151', '152', '153', '154', '155', '211',
    '212', '213', '214', '215', '221', '222', '223', '224', '225', '231',
    '232', '233', '234', '235', '241', '242', '243', '244', '245', '251',
    '252', '253', '254', '255',
  },
  up_key = 'i',
  down_key = 'e',
})

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
