# my-setup

> My personal Arch Linux development environment.

This repository contains everything I use to bootstrap a fresh Arch Linux installation into my preferred development environment. It includes package installation, GNU Stow-managed configurations, and post-install setup scripts.

## Features

* 📦 Install packages from the official repositories and AUR
* 🗂️ Manage dotfiles with GNU Stow
* 🖥️ AwesomeWM configuration
* ⚡ Neovim configuration with Lazy.nvim
* 🪟 tmux configuration with TPM
* 🔧 Automated post-install setup
* 🚀 One-command bootstrap

## Repository Structure

```text
.
├── bootstrap.sh
├── dotfiles/
│   ├── configs/
│   └── install.sh
├── packages/
│   ├── install.sh
│   ├── packages.conf
│   └── lib/
├── setup/
│   ├── nvim.sh
│   ├── services.sh
│   └── tmux.sh
└── README.md
```

## Installation

Clone the repository and run the bootstrap script:

```bash
git clone <repository-url>
cd my-setup
./bootstrap.sh
```

The bootstrap process will:

* Install required packages
* Stow all configuration files
* Install Neovim plugins
* Install tmux plugins
* Enable required system services

## Directory Overview

| Directory      | Purpose                                          |
| -------------- | ------------------------------------------------ |
| `packages/`    | Package installation and package definitions     |
| `dotfiles/`    | GNU Stow packages and configuration files        |
| `setup/`       | Post-install configuration scripts               |
| `bootstrap.sh` | Entry point that orchestrates the complete setup |

## Philosophy

* Reproducible
* Idempotent
* Modular
* Minimal manual intervention

This repository is primarily intended for my own machines and workflow, but anyone is welcome to use it as inspiration or adapt it for their own setup.
