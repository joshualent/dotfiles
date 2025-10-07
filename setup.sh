#!/usr/bin/env bash
set -euo pipefail

# Stow everything from repo root into ~/.config (per root .stowrc)
stow .

# Stow files from home/ into ~ (per home/.stowrc)
( cd home && stow . )

echo "Done. To undo: stow -D . && (cd home && stow -D .)"

