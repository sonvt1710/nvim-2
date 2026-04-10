# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim 0.12+ configuration repository using a modular Lua-based setup with `vim.pack` (built-in plugin manager).

## Prerequisites

```sh
brew install neovim           # Neovim 0.12+
brew install tree-sitter-cli  # Required by nvim-treesitter to compile parsers
npm install -g tree-sitter-cli  # Alternative: install via npm
```

Nerd Font icons require `Symbols Nerd Font Mono` installed as a terminal font fallback:

```sh
brew install --cask font-symbols-only-nerd-font
```

## Architecture

```
init.lua                 # Entry point - loads all modules in order
lua/config/              # Core configuration modules
  ├── options.lua        # Editor settings (tabs, search, UI)
  ├── keymaps.lua        # Key bindings (leader=space)
  ├── autocommands.lua   # Auto behaviors (trim whitespace, etc.)
  ├── pack.lua           # vim.pack plugin manager - all plugins listed here
  ├── colorscheme.lua    # Theme configuration (default)
  ├── lsp.lua            # LSP server config, diagnostics, keymaps
  └── icons.lua          # Shared icon definitions (used by blink.cmp and breadcrumbs)
lua/plugins/             # Plugin configurations (auto-loaded by pack.lua)
  └── *.lua              # Each file configures one plugin via require("plugin").setup()
lsp/                     # Per-server LSP configs (native vim.lsp.config format)
  └── ts_ls.lua          # TypeScript LSP config
functions/               # Custom Lua functions
  └── search-projects.lua
```

## Key Configuration Details

- **Leader key**: Space (`<Space>`)
- **Local leader**: Space (`<Space>`)
- **Tab settings**: 2 spaces, expandtab enabled
- **System clipboard**: Integrated via `unnamedplus`
- **Plugin manager**: `vim.pack` (Neovim 0.12 built-in)
- **Colorscheme**: `default` (Neovim 0.12 built-in)
- **Statusline**: Built-in default (diagnostics, LSP progress, cursor position)
- **Completion**: blink.cmp
- **Fuzzy finder**: fzf-lua
- **Formatter**: conform.nvim
- **Linter**: nvim-lint

## Common Development Tasks

### Adding a new plugin
1. Add the GitHub URL to `vim.pack.add()` in `lua/config/pack.lua`
2. Create a config file in `lua/plugins/` (auto-loaded on startup)
3. Restart nvim - `vim.pack` auto-installs missing plugins

### Removing a plugin
1. Remove the URL from `lua/config/pack.lua`
2. Delete its config file from `lua/plugins/`
3. Run `:lua vim.pack.del({"plugin-name"})` to clean up installed files

### Modifying core settings
- Editor options: `lua/config/options.lua`
- Key mappings: `lua/config/keymaps.lua`
- Auto commands: `lua/config/autocommands.lua`
- LSP servers: `lua/config/lsp.lua` (enable/disable servers)
- Icons: `lua/config/icons.lua` (shared by blink.cmp and breadcrumbs)

### Configuration Flow
1. `init.lua` loads: options → keymaps → autocommands → pack → colorscheme → lsp
2. `pack.lua` installs all plugins via `vim.pack.add()`, then auto-loads all `lua/plugins/*.lua`
3. Each plugin config is a plain Lua module that calls `require("plugin").setup()`

### Installing treesitter parsers
```vim
:TSInstall tsx typescript javascript lua  " etc.
```

## Important Notes

- Requires Neovim 0.12+ for `vim.pack` and built-in features
- Treesitter highlighting is started natively via `vim.treesitter.start()` (not the plugin)
- LSP is configured via native `vim.lsp.enable()` and `vim.lsp.config()` (no nvim-lspconfig needed)
- Native `gc`/`gcc` commenting with `ts-comments.nvim` for JSX/TSX context awareness
- Native LSP `documentHighlight` replaces vim-illuminate
- Icon characters cannot be written by Claude Code - edit `lua/config/icons.lua` manually in nvim
