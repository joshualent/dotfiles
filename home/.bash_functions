# UV sync wrapper
uv() {
    if [[ "$1" == "sync" ]]; then
        if [[ ! -d ".venv" ]]; then
            command uv venv --seed
        fi
        command uv sync "${@:2}"
    else
        command uv "$@"
    fi
}

# SSH agent auto-start (consider adding to .bash_functions)
SSH_ENV="$HOME/.ssh/environment"

start_agent() {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
}