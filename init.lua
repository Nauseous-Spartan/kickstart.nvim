-- Requirements
require 'config.lazy'

-- Populate commentstring for Python
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.bo.commentstring = '# %s'
  end,
})

-- Set <space> to be the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse
vim.o.mouse = 'a'

-- Hide the mode from being displayed in the command line
vim.o.showmode = false

-- Makes the indenting consistent for long lines
vim.o.breakindent = true

-- Save undo history to an external file
vim.o.undofile = true

-- Enables the signcolumn to the left of the number line which shows things like git changes
vim.o.signcolumn = 'yes'

-- Set the time before an autosave commences
vim.o.updatetime = 250

-- Set the time window to activate a mapped shortcut
vim.o.timeoutlen = 400

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Highlights which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

-- Shiftwidth and SoftTabstop
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Open and Close Terminal
vim.keymap.set('n', '<leader>z', '<cmd>sp<CR><cmd>term<CR><cmd>resize 15<CR>a', { desc = 'Open Terminal Window' })
vim.keymap.set('n', '<leader>x', '<C-w><C-j><cmd>q<CR>', { desc = 'Close Terminal Window' })

-- Yank Whole File
vim.keymap.set('n', '<leader>y', '<cmd>%y+<CR>', { desc = 'Yank Whole File' })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
