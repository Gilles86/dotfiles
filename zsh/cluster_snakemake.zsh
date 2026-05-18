# Cluster / Snakemake monitoring helpers.
#
# Functions vs aliases: anything that takes args or interpolates
# is a function; pure shortcuts stay aliases.
#
# Cluster host alias: `sciencecluster` (configured in ~/.ssh/config).
# Repo on cluster: `~/git/retsupp` (adjust REPO env var if you want
# to point these at a different project that also uses Snakemake).

: ${SNAKE_REPO:=~/git/retsupp}
: ${SNAKE_HOST:=sciencecluster}

# --- one-shot status snapshot -------------------------------------------
# Driver state + progress %, in-flight jobs by rule, completed-last-hour.
snake-status() {
    ssh "$SNAKE_HOST" "bash $SNAKE_REPO/retsupp/snakemake/status.sh"
}

# --- live driver feed ---------------------------------------------------
# tail -f on the latest driver_<jobid>.log. Ctrl+C to detach.
snake-tail() {
    ssh "$SNAKE_HOST" "tail -f \$(ls -t $SNAKE_REPO/retsupp/snakemake/logs/driver_*.log 2>/dev/null | head -1)"
}

# --- progress % only ----------------------------------------------------
snake-progress() {
    ssh "$SNAKE_HOST" "grep -oE '[0-9]+ of [0-9]+ steps \\([0-9]+%\\) done' \
        \$(ls -t $SNAKE_REPO/retsupp/snakemake/logs/driver_*.log | head -1) | tail -1"
}

# --- what's running RIGHT NOW (rule + wildcards, not the UUID name) -----
snake-queue() {
    ssh "$SNAKE_HOST" 'squeue -u $USER -h -O "JobID:14,State:10,TimeUsed:10,Comment:80" | head -40'
}

# --- failures grep ------------------------------------------------------
snake-failed() {
    ssh "$SNAKE_HOST" "grep -E 'Error|Failed|error in|Aborting' \
        \$(ls -t $SNAKE_REPO/retsupp/snakemake/logs/driver_*.log | head -1) | tail -15"
}

# --- watch loop (auto-refresh snapshot every 30s) ----------------------
# Local watch (1 ssh call every refresh — easier on the cluster than
# remote watch).
snake-watch() {
    while true; do
        clear
        snake-status
        echo
        echo "(refreshing every 30s; Ctrl+C to stop)"
        sleep 30
    done
}

# --- cancel all snake-driven jobs for THIS user (rare, dangerous) ------
# Cancels every SLURM job whose --comment starts with "rule_" — that's
# the SLURM plugin's signature. Won't touch hand-submitted sbatch jobs.
snake-cancel-all() {
    print -P "%F{red}This will scancel every Snakemake-launched job. Continue? [y/N]%f"
    read -k1 ans
    print
    [[ "$ans" == "y" ]] || { echo "aborted"; return 1 }
    ssh "$SNAKE_HOST" '
        ids=$(squeue -u $USER -h -O "JobID:14,Comment:80" \
              | awk "$2 ~ /^rule_/ {print $1}" \
              | awk -F_ "{print $1}" | sort -u)
        [ -n "$ids" ] && scancel $ids && echo "cancelled: $(echo $ids | wc -w) jobs" \
                      || echo "nothing to cancel"
    '
}

# --- cluster general helpers --------------------------------------------
# Held tasks ("user env retrieval failed" — NFS dogpile recovery).
# Release them; they were waiting on a system glitch, not a real
# dependency failure.
qme-release() {
    ssh "$SNAKE_HOST" '
        held=$(squeue --me -h -t PD --format="%A %r" \
               | awk "/user env|JobHeldUser/ {print \$1}" | sort -u)
        [ -n "$held" ] && echo $held | xargs -n 1 scontrol release \
            && echo "released $(echo $held | wc -w) held tasks" \
            || echo "no held tasks"
    '
}

# Zombie cleanup ("DependencyNeverSatisfied" — upstream failed,
# downstream will never run). Cancel them.
qme-zombies() {
    ssh "$SNAKE_HOST" '
        ids=$(squeue --me -h -t PD -O "JobID:14,Reason:30" \
              | grep DependencyNeverSat | awk "{print \$1}" \
              | awk -F_ "{print \$1}" | sort -u)
        [ -n "$ids" ] && scancel $ids && echo "cancelled $(echo $ids | wc -w) zombie jobs" \
                      || echo "no zombies"
    '
}

# --- help ---------------------------------------------------------------
snake-help() {
    cat <<'EOF'
Snakemake cluster monitoring shortcuts (see ~/.zsh/cluster_snakemake.zsh).

Live monitoring:
  snake-status        snapshot: progress + in-flight by rule + last-hour completions
  snake-tail          live tail of the driver log (Ctrl+C to detach)
  snake-progress      just the "X of Y steps done" line
  snake-queue         in-flight SLURM jobs by rule (uses --comment, not the UUID name)
  snake-failed        grep errors/failures in the driver log
  snake-watch         auto-refresh snake-status every 30s

Cluster maintenance:
  qme-release         release held-task NFS-dogpile tasks (`user env retrieval failed`)
  qme-zombies         scancel DependencyNeverSatisfied tasks
  snake-cancel-all    scancel every snakemake-launched job (confirms first)

Env:
  SNAKE_HOST          ssh host alias (default: sciencecluster)
  SNAKE_REPO          repo root on the cluster (default: ~/git/retsupp)
EOF
}
