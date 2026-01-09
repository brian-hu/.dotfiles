# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managing configurations for shell (zsh), neovim, tmux, alacritty terminal, and Linux window managers (xmonad, polybar). Configurations are stored here and symlinked to their expected locations.

## Installation

Use `install.sh` to symlink dotfiles to their home directory locations:
```bash
./install.sh zsh              # Install zsh configs
./install.sh config           # Install neovim, picom, polybar
./install.sh zsh tmux config  # Install multiple directories
./install.sh all              # Install everything
```

Each directory in the repo mirrors `$HOME`. The script symlinks top-level items from the specified directory to `$HOME`, backing up existing files.

## Symlink Structure

Dotfiles are symlinked from `~/.dotfiles/` to home directory locations:
```
~/.zshrc           → ~/.dotfiles/zsh/.zshrc
~/.zsh-theme       → ~/.dotfiles/zsh/.zsh-theme
~/.fzf.zsh         → ~/.dotfiles/zsh/.fzf.zsh
~/.tmux.conf       → ~/.dotfiles/tmux/.tmux.conf
~/.tmux            → ~/.dotfiles/tmux/.tmux
~/.config/nvim     → ~/.dotfiles/config/.config/nvim
~/.alacritty.yml   → ~/.dotfiles/alacritty/.alacritty.yml
~/.alacritty-theme → ~/.dotfiles/alacritty/.alacritty-theme
~/.claude          → ~/.dotfiles/claude/.claude
```

## Unified Theme System

The colorscheme script (`scripts/colorscheme.sh`) switches themes across all tools simultaneously:
- Run with `cs` alias or `~/.dotfiles/scripts/colorscheme.sh`
- Uses fzf to select from 11 themes (Gruvbox Material, Everforest, Sonokai variants)
- Modifies config files via sed to update theme references in nvim, tmux, zsh, and alacritty
- Theme files are stored in parallel directories: `zsh/.zsh-theme/`, `tmux/.tmux/tmuxline/`, `alacritty/.alacritty-theme/`

When modifying theme-related code, ensure changes are applied consistently across all four applications.

## Neovim Configuration

- Entry point: `config/.config/nvim/init.lua` (Lua, lazy.nvim plugin manager)
- Traditional settings: `config/.config/nvim/vimrc.vim` (sourced by init.lua)
- LSP servers configured: pyright, ts_ls, rust-analyzer, gopls, bashls, ruff, clangd
- Colorscheme and airline theme are set in `vimrc.vim` (modified by colorscheme.sh)

## Zsh Configuration

- Uses zinit plugin manager (auto-installs on first run)
- Powerlevel10k theme with custom theme snippets in `.zsh-theme/`
- Plugins: zsh-autosuggestions, zsh-completions, fast-syntax-highlighting
- Sources external files: `~/.zshrc.bloomberg`, `~/.lcldevrc`, `~/.fzf.zsh`

## Tmux Configuration

- Uses TPM (Tmux Plugin Manager) at `tmux/.tmux/plugins/tpm`
- Tmuxline theme files in `tmux/.tmux/tmuxline/` (generated from vim-airline)
- Plugins: tmux-yank, tmux-copycat, tmux-resurrect, tmux-fzf

## Useful Aliases

- `v` - nvim
- `cs` - colorscheme switcher
- `dc` - docker compose
- `grb` - git rebase workflow (checkout main, pull, rebase current branch, force push)

## Python Virtual Environment Helpers

Functions in `.zshrc`:
- `mkvenv <name> [python]` - create venv in `~/.python_envs/`
- `rmvenv <name>` - remove venv
- `lsvenv` - list venvs
- `venv <name>` - activate venv

## Platform Notes

- Primary platform: macOS
- Linux configs present but may be stale: xmonad, polybar, picom, xbindkeys
