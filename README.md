# Gilles' dotfiles

Global configuration files, mostly setting up

 * zsh + [zinit](https://github.com/zdharma-continuum/zinit) + powerlevel10k
 * tmux (with auto-attach on SSH login)
 * vim (via [vim-plug](https://github.com/junegunn/vim-plug))

Managed with [dotbot](https://github.com/anishathalye/dotbot). To install, go to the
root of this folder and run

```
./install
```

It is idempotent, so re-run it after every pull.

## On a fresh machine

```bash
git clone https://github.com/Gilles86/dotfiles.git ~/git/dotfiles
cd ~/git/dotfiles && ./install
touch ~/.tmux_autostart       # optional: land in tmux on SSH login (see below)
```

`zsh` and `tmux` must come from the system package manager first; `./install` handles
fzf, zoxide and the vim plugins, and zinit bootstraps itself on the first interactive
shell.

The private `~/.claude` config lives in a separate private repo and is skipped
automatically on machines without a GitHub SSH key.

## Auto-tmux on SSH

Create `~/.tmux_autostart` on a remote machine and every interactive SSH login drops
straight into a persistent `tmux` session named `gilles` — detach with `Ctrl-b d`,
reconnect later and everything is still running. `scp`, `rsync`, `ssh host <cmd>` and
VSCode Remote-SSH are unaffected. Bypass once with `NO_TMUX_AUTOSTART=1 ssh <host>`.

It should look something like this:
![Alt text](screenshots/myzsh.png?raw=true "Title")
