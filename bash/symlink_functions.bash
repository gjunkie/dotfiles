link_vim_files() {
  # Force remove the vim directory if it's already there.
  _exists "${HOME}/.vim" \
  && rm -rf "${HOME}/.vim"

  ln -fs "${PROGDIR}/vim"                 "${HOME}/.vim"
  ln -fs "${PROGDIR}/conf/runcom/vimrc"   "${HOME}/.vimrc"

  [[ $? ]] \
  && _print_success "ViM files symlinked"
}

link_bash_files() {
  rm -rf "${HOME}/.bash"
  rm "${HOME}/.bashrc"
  rm "${HOME}/.profile"

  ln -fs "${PROGDIR}/conf/runcom/bashrc"  "${HOME}/.bashrc"
  ln -fs "${PROGDIR}/bash"                "${HOME}/.bash"

  [[ $? ]] \
  && _print_success "bash files symlinked"
}

link_tmux_files() {
  rm -rf "${HOME}/.tmux.conf"

  ln -fs "${PROGDIR}/conf/tmux/tmux.conf" "${HOME}/.tmux.conf"

  [[ $? ]] \
  && _print_success "tmux files symlinked"
}

source_bash() {
  source "${HOME}/.bashrc"
  [[ $? ]] \
  && _print_success "bash files sourced"
}
