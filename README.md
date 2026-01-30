# Personal Dotfiles

Development environment configuration for macOS, Linux, and WSL2. Managed via [Ansible](https://github.com/GabrielDCelery/personal-dev-environment-quickstart) and symlinked with GNU Stow.

> [!WARNING]
> Cloning this repo and running `stow` directly will not work properly. Use the [dev environment quickstart](https://github.com/GabrielDCelery/personal-dev-environment-quickstart) Ansible playbook instead.

## Architecture

- **Shell**: Zsh with Starship prompt, FZF, syntax highlighting, autosuggestions
- **Editor**: Neovim with lazy.nvim plugin manager (LSP, Treesitter, Telescope, etc.)
- **Terminals**: WezTerm, Tmux, Zellij
- **Version Manager**: [Mise](https://mise.jdx.dev/) (manages Node, Python, Go, Rust, Terraform, and 50+ other tools)
- **Theme**: Catppuccin Mocha across all applications
- **Provisioning**: Ansible (via separate [quickstart repo](https://github.com/GabrielDCelery/personal-dev-environment-quickstart))

## What's Configured

| Category | Tools |
| --- | --- |
| **Terminals** | WezTerm, Tmux, Zellij |
| **Editor** | Neovim (40+ plugin configs) |
| **Shell** | Zsh, Starship, FZF, zoxide, eza |
| **Languages** | Node, Python, Go, Rust, Lua |
| **Cloud** | AWS (aws-vault), Azure CLI, DigitalOcean CLI |
| **Kubernetes** | k9s, kubectl, minikube |
| **DevOps** | Ansible, Terraform, Sops, Age, Dagger |
| **CLI Tools** | ripgrep, fd, bat, jq, yq, yazi, grc |
| **Monitoring** | btop |

## Structure

```
.dotfiles/
├── .config/
│   ├── nvim/              # Neovim config (Lua, lazy.nvim)
│   ├── mise/              # Tool version management
│   ├── zellij/            # Terminal multiplexer layouts
│   ├── tmuxinator/        # Tmux session templates
│   ├── bat/               # Syntax-highlighted cat replacement
│   ├── btop/              # System monitor themes
│   ├── ghostty/           # Terminal emulator config
│   ├── k9s/               # Kubernetes UI config
│   ├── starship.toml      # Shell prompt
│   └── custom-config-overrides/
├── .grc/                  # Generic Colorizer configs
├── .gnupg/                # GPG agent config
├── .tmux.conf             # Tmux config (prefix: Ctrl+Space)
├── .wezterm.lua           # WezTerm terminal config
└── .zshrc.personal        # Zsh shell config
```

## Key Bindings

**Tmux** (prefix: `Ctrl+Space`):
- Split: `|` horizontal, `-` vertical
- Navigate: `h/j/k/l`
- Resize: `Alt+h/j/k/l`

**Zsh**:
- Vim-style navigation with `Ctrl+A/E`, `Ctrl+Left/Right`
- FZF fuzzy finding integrated

## Shell Aliases

```sh
alias e='eza'
alias k='grc kubectl'
alias ls='grc ls'
alias ps='grc ps'
```
