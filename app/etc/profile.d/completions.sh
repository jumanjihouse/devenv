files="
  /usr/share/bash-completion/completions/docker
  /usr/share/bash-completion/completions/git
  /usr/share/bash-completion/completions/tmux
"
for file in ${files}; do
  [ -r ${file} ] && source ${file}
done
