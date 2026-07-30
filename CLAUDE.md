# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Installation

Deploy all dotfiles (symlinks everything via dotbot):

```bash
./install
```

This runs dotbot with `install.conf.yaml`, which initializes git submodules, symlinks
config files into `~`, and installs fzf/zoxide/vim plugins. It is idempotent — re-run
it after pulling.

The checkout can live anywhere (`~/git/dotfiles` on all current machines); nothing
hardcodes its path. Every config reaches its siblings through the `~/.…` symlinks.

## Repository Structure

Personal dotfiles managed by [dotbot](https://github.com/anishathalye/dotbot) (included as a submodule in `dotbot/`).

**Symlink targets** (defined in `install.conf.yaml`):
- `~/.zshrc` → `zshrc`, `~/.zsh/` → `zsh/`, `~/.p10k.zsh` → `p10krc`
- `~/.vimrc` → `vimrc`, `~/.vim/` → `vim/`
- `~/.tmux.conf` → `tmux.conf`, `~/.tmux-sensible/` → `tmux-sensible/`

`gitconfig` / `gitignore_global` are tracked but **not** linked: the laptop's live
`~/.gitconfig` has diverged and is the better one, while the tracked copy is a stale
2022 template. Merge them by hand before ever re-enabling that link.

**Submodules**: `dotbot` (installer), `tmux-sensible` (tmux defaults), and
`claude-private` (private `~/.claude` config, cloned over SSH). The private one is
optional — `./install` reports it as skipped on machines without a GitHub SSH key
rather than failing.

Vim plugins come from **vim-plug** (`vim/autoload/plug.vim`, plugin list in `vimrc`),
not from submodules under `vim/bundle/`.

## Auto-tmux on SSH

`zsh/tmux_autostart.zsh` (sourced at the very top of `zshrc`) execs into
`tmux new-session -A -s gilles` so an SSH login lands directly in a persistent
session. It is **opt-in per machine** — it does nothing unless `~/.tmux_autostart`
exists:

```bash
touch ~/.tmux_autostart      # enable on this machine
rm ~/.tmux_autostart         # disable
```

Guards keep it away from anything that is not a human at a terminal: non-SSH shells,
`ssh host <cmd>`, scp/rsync, shells already inside tmux, `TERM=dumb`, and VSCode
Remote-SSH. One-off bypass: `NO_TMUX_AUTOSTART=1 ssh <host>`. Session name overridable
via `$TMUX_SESSION`.

Doing this shell-side rather than with `RemoteCommand` in `~/.ssh/config` is
deliberate: `RemoteCommand` also applies to non-interactive `ssh host <cmd>` calls and
breaks scp/rsync and editor remotes.

## Zsh Architecture

`zshrc` sources modular files from `~/.zsh/` in a specific order that matters:

1. **`zsh/powerlevel10k.zsh`** — instant prompt setup (must be first)
2. **zinit plugin loading** (in `zshrc`) — turbo mode (`wait lucid`) for fast startup; plugins: `zsh-autosuggestions`, `zsh-history-substring-search`, `fzf-tab`, `zsh-vi-mode`, `zsh-syntax-highlighting`
3. **`zsh/zshenv.zsh`** — PATH and env vars (FreeSurfer, FSL, ANTs, AFNI)
4. **`zsh/conda.zsh`** — conda init with auto-detection across common install
   locations. Searches `$HOME` (mambaforge/miniforge3/miniconda3/anaconda3), then
   `$DATA_DIR` (default `/data`), then `/opt` — the workstation and cloud VMs keep
   conda on the big data disk, with nothing under `$HOME` at all.
5. **`zsh/key_bindings.zsh`** — keybindings
6. **`~/.zshrc_local`** — machine-local overrides (not tracked)
7. **`zsh/aliases.zsh`** — loaded **last** to override system defaults and plugin aliases

**Important**: `zsh/aliases.zsh` must remain last. It explicitly unsets system `ls` aliases before redefining them. `ZSH_HIGHLIGHT_DISABLE_ALIASES_CHECKING=true` is set to prevent `zsh-syntax-highlighting` from overwriting custom aliases.

**zoxide + vi-mode ordering**: `zoxide init` is deferred via `zvm_after_init_commands` because `zsh-vi-mode` clears `chpwd` hooks on init. A fallback init at the end of `zshrc` covers the case when vi-mode is not active.

## Domain Context

The environment targets neuroimaging workstation/cluster use: FreeSurfer, FSL, ANTs, AFNI tools are on PATH via `zsh/zshenv.zsh`, with lazy-loading for expensive setups. `aliases.zsh` includes SLURM job monitoring (`qme`).
