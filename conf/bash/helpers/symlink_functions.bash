link_vim_files() {
  # Force remove the vim directory if it's already there.
  _exists "${HOME}/.vim" \
  && rm -rf "${HOME}/.vim"

  ln -fs "${PROGDIR}/vim"                "${HOME}/.vim"
  ln -fs "${PROGDIR}/conf/runcom/vimrc"    "${HOME}/.vimrc"

  [[ $? ]] \
  && _print_success "ViM files symlinked"
}

link_bash_files() {
  rm -rf "${HOME}/.bash_profile"
  rm -rf "${HOME}/.bash_helpers"
  rm -rf "${HOME}/.bashrc"
  rm -rf "${HOME}/.profile"

  ln -fs "${PROGDIR}/conf/runcom/bashrc"          "${HOME}/.bashrc"
  ln -fs "${PROGDIR}/conf/bash/helpers"         "${HOME}/.bash_helpers"
  ln -fs "${PROGDIR}/conf/bash/bash_profile"    "${HOME}/.bash_profile"

  [[ $? ]] \
  && _print_success "bash files symlinked"
}

link_tmux_files() {
  rm -rf "${HOME}/.tmux.conf"

  ln -fs "${PROGDIR}/conf/tmux/tmux.conf"          "${HOME}/.tmux.conf"

  [[ $? ]] \
  && _print_success "tmux files symlinked"
}

source_bash() {
  source "${HOME}/.bashrc"
  source "${HOME}/.bash_profile"
  [[ $? ]] \
  && _print_success "bash files sourced"
}
