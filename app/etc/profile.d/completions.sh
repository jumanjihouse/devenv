# shellcheck shell=bash
files="
  /usr/share/bash-completion/completions/docker
  /usr/share/bash-completion/completions/git
  /usr/share/bash-completion/completions/tmux
"
for file in ${files}; do
  # shellcheck disable=SC1090
  [ -r "${file}" ] && . "${file}"
done
