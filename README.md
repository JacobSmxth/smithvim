# smithvim - Minimal, High-Performance Full-Stack Neovim

A clean, Java-first Neovim configuration built on LazyVim with minimal UI and maximum performance.

## Features

### Java Development (Primary)
- **JDTLS** language server via LazyVim Java extra
- **Java Debug Adapter** and **Java Test** support
- 4-space indentation, 100-character column marker (Java files only)
- Key bindings under `<leader>j` for Java-specific actions:
  - `<leader>jo` - Organize imports
  - `<leader>jv` - Extract variable (visual mode)
  - `<leader>jm` - Extract method (visual mode)
  - `<leader>jtm` - Test nearest method
  - `<leader>jtc` - Test class

### Web Development
- **TypeScript/JavaScript** via `typescript-tools.nvim` (faster than default tsserver)
- **HTML/CSS** with Emmet support
- **ESLint** integration for code actions
- **Prettier/Prettierd** formatting via Conform.nvim
- No Tailwind (keeps things lightweight)

### Testing & Debugging
- **Jest** support for JS/TS projects
- **Optional Neotest** integration (see [Enabling Neotest](#enabling-neotest))
- **nvim-dap-vscode-js** for JavaScript/TypeScript debugging
- Test keybindings under `<leader>t` (when neotest is enabled)
- Debug keybindings under `<leader>d`

### Minimal UI
- **No icon fonts** - uses simple ASCII characters
- **Clean Lualine** without separators or icons
- **Neo-tree** with minimal ASCII indicators
- **Disabled dashboards** for faster startup
- Simple notifications and minimal visual noise

### Quality of Life
- **Gitsigns** with subtle blame information
- **Spectre** for project-wide search/replace (`<leader>sr`)
- **mini.pairs** for automatic bracket pairing
- **nvim-bqf** for enhanced quickfix windows
- **Context-aware commenting** for JS/TS/TSX files

## Installation

This configuration is designed to work with an existing LazyVim setup:

1. Clone or copy these configuration files to your `~/.config/nvim/`
2. Run `nvim` to install plugins automatically
3. Mason will install required language servers and tools

## Required Tools (Installed via Mason)

### Java
- `jdtls` - Java language server
- `java-debug-adapter` - Debug support
- `java-test` - Test runner integration

### Web Development
- `typescript-language-server` - TypeScript/JavaScript LSP
- `html-lsp` - HTML language support
- `css-lsp` - CSS language support
- `emmet-ls` - Emmet completion
- `json-lsp` - JSON language support
- `yamlls` - YAML language support
- `prettierd` & `prettier` - Code formatting
- `eslint_d` - Fast ESLint integration
- `js-debug-adapter` - JavaScript/TypeScript debugging

## Configuration Files

- `lua/plugins/java.lua` - Java language support and JDTLS configuration
- `lua/plugins/web.lua` - Web development stack (TS/JS/HTML/CSS)
- `lua/plugins/formatting.lua` - Conform.nvim setup for unified formatting
- `lua/plugins/testing.lua` - Testing and debugging configuration
- `lua/plugins/ui_minimal.lua` - Minimal UI customizations
- `lua/plugins/essentials.lua` - Quality-of-life plugins
- `lazyvim.json` - LazyVim extras configuration

## Optional Features

### Enabling Neotest

Neotest is disabled by default for faster startup. To enable it:

**Option 1: Environment variable**
```bash
export SMITHVIM_ENABLE_NEOTEST=1
nvim
```

**Option 2: Create a marker file**
```bash
touch .smithvim-neotest
nvim
```

When enabled, neotest provides:
- `<leader>tn` - Run nearest test
- `<leader>tf` - Run current file tests
- `<leader>ts` - Toggle test summary
- `<leader>to` - Show test output

### Java Formatter Configuration

Java formatting uses JDTLS by default. To use Google or Eclipse style:

1. Download the appropriate XML style file:
   - [Google Java Style](https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml)
   - [Eclipse Java Style](https://github.com/eclipse/eclipse.jdt.ui/blob/master/org.eclipse.jdt.ui/core%20extension/org/eclipse/jdt/internal/ui/preferences/formatter/ProfileVersioner.java)

2. Place it in your project or home directory
3. Configure JDTLS to use it (see JDTLS documentation)

## Performance Features

- **Lazy loading** - All plugins load only when needed
- **Treesitter** limited to essential parsers
- **Mason** includes error handling for Open VSX outages
- **Fast startup** - No heavy dashboards or unnecessary plugins
- **Minimal dependencies** - Only essential tools included

## Troubleshooting

### Mason Installation Issues

If `java-debug-adapter` or `java-test` fail to install:

1. Check Open VSX status (common outage source)
2. Retry installation: `:MasonInstall java-debug-adapter java-test`
3. Check `:Mason` logs for detailed error information

### TypeScript Issues

If TypeScript support isn't working:

1. Ensure `typescript-tools.nvim` is loaded: `:Lazy`
2. Check that default tsserver is disabled (this config handles it)
3. Verify `typescript-language-server` is installed: `:Mason`

### Format on Save Not Working

1. Check Conform.nvim status: `:ConformInfo`
2. Ensure formatters are installed: `:Mason` → check `prettierd`/`prettier`
3. Large files (>1000 lines) skip format-on-save for performance

## Key Bindings Summary

### Java (`<leader>j`)
- `jo` - Organize imports
- `jv` - Extract variable (visual)
- `jm` - Extract method (visual)
- `jtm` - Test method
- `jtc` - Test class

### Testing (`<leader>t`) - when neotest enabled
- `tn` - Run nearest test
- `tf` - Run file tests
- `ts` - Toggle summary
- `to` - Show output

### Debugging (`<leader>d`)
- `db` - Toggle breakpoint
- `dc` - Continue
- `ds` - Step over
- `di` - Step into
- `do` - Step out
- `du` - Toggle debug UI

### General
- `<leader>sr` - Spectre search/replace
- `<leader>f` - Format buffer

---

**smithvim** - Function over flair, performance over flashiness.
