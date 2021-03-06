local AU = require('fintory.augroup')
local g = vim.g
local o = vim.o

-- Make colors more accurate in a terminal window
o.termguicolors = true
o.background = 'dark'

-- Hide '-- INSERT --' line
vim.cmd('set noshowmode')

-- Ignore some files
vim.opt.wildignore:append {
    '.DS_Store',
    '*_build/*',
    '**/coverage/*',
    '**/node_modules/**/*',
    './node_modules/**/*',
    '**/.git/*',
    '**/.next/*'
}

-- Hide mode lines,but always show status line
o.modelines = 0
o.laststatus = 2

-- Better editing experience
o.expandtab = true
o.cindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1

-- Set leader to blank space
g.mapleader = ' '
g.maplocalleader = ' '

-- Decrease scroll with keyboard
o.scroll = 10

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Increase history
o.history = 50

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Better editor UI
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'no'
o.cursorline = true

-- Set some definitive file types
AU.create_augroup({
  { 'BufRead,BufNewFile', '*.md', 'set filetype=markdown' },
  { 'BufRead,BufNewFile', '*.jb,Podfile,Fastfile,Appfile,Matchfile', 'set filetype=ruby' },
  { 'BufRead,BufNewFile', '*.sol', 'set filetype=solidity' },
  { 'BufRead,BufNewFile', 'aliases.local,zshrc.local,*/zsh/configs/*', 'set filetype=zsh' },
  { 'BufRead,BufNewFile', 'gitconfig.local', 'set filetype=gitconfig' },
  { 'BufRead,BufNewFile', 'tmux.conf.local', 'set filetype=tmux' }
}, 'vimrcEx')
