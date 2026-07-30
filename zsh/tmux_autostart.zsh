# Drop straight into a persistent tmux session on interactive SSH logins.
#
# Opt in per machine by creating the marker file:
#
#     touch ~/.tmux_autostart
#
# so laptops and shared login nodes are unaffected until you ask for it.
# Override the session name with $TMUX_SESSION, or skip entirely for one
# connection with `NO_TMUX_AUTOSTART=1 ssh <host>`.
#
# Every guard below exists to keep this from hijacking a session that is not a
# human sitting at a terminal — `ssh host <cmd>`, scp/rsync, VSCode Remote-SSH
# and editor shells must all pass through untouched.

[[ -f "$HOME/.tmux_autostart" ]] || return 0
[[ -z "$NO_TMUX_AUTOSTART" ]]    || return 0
[[ -n "$SSH_CONNECTION" ]]       || return 0   # local shells stay as they are
[[ -z "$TMUX" ]]                 || return 0   # already inside tmux
[[ -o interactive ]]             || return 0
[[ -t 0 && -t 1 ]]               || return 0   # real terminal only
[[ "$TERM" != dumb && "$TERM" != linux ]] || return 0
[[ -z "$VSCODE_INJECTION" && "$TERM_PROGRAM" != vscode && -z "$VSCODE_RESOLVING_ENVIRONMENT" ]] || return 0
command -v tmux >/dev/null       || return 0

# Attach to the standard session, creating it if it does not exist yet.
exec tmux new-session -A -s "${TMUX_SESSION:-gilles}"
