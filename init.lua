vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamed"

vim.api.nvim_create_autocmd({"TextYankPost"}, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})

local opt = { noremap = true, silent = true}
vim.g.mapleader = " "
vim.keymap.set("n", "<C-l>", "<C-w>l", opt)
vim.keymap.set("n", "<C-h>", "<C-w>h", opt)
vim.keymap.set("n", "<C-j>", "<C-w>j", opt)
vim.keymap.set("n", "<C-k>", "<C-w>k", opt)
vim.keymap.set("n", "<Leader>v", "<C-w>v", opt)
vim.keymap.set("n", "<Leader>s", "<C-w>s", opt)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		'navarasu/onedark.nvim',
		lazy = true
	},
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.5',
      		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		keys = {
		  { "<leader>p", ":Telescope find_files<CR>", desc = "find files" },
		}
	},
	{
    		"williamboman/mason.nvim"
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig"
	}

})
require('onedark').setup {
	style = 'darker'
}
require('onedark').load()
require('mason').setup()
require('mason-lspconfig').setup()
-- require('lspconfig').python.setup {}

