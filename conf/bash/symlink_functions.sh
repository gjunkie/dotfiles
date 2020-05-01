link_vim_files() {
  # Force remove the vim directory if it's already there.
  _exists "${HOME}/.vim" \
  && rm -rf "${HOME}/.vim"

  ln -fs "${PROGDIR}/vim"                 "${HOME}/.vim"
  ln -fs "${PROGDIR}/conf/runcom/vimrc.vim"   "${HOME}/.vimrc"

  [[ $? ]] \
  && _print_success "Vim files symlinked"
}

link_zsh_files() {

  ln -fs "${PROGDIR}/zsh"                 "${HOME}/.zsh"
  ln -fs "${PROGDIR}/conf/runcom/zshrc.zsh"  "${HOME}/.zshrc"

  [[ $? ]] \
  && _print_success "zsh files symlinked"
}

link_bash_files() {
  rm -rf "${HOME}/.bash"
  rm -rf "${HOME}/.bashrc"
  rm -rf "${HOME}/.profile"

  ln -fs "${PROGDIR}/conf/runcom/bash_profile.sh"  "${HOME}/.bash_profile"
  ln -fs "${PROGDIR}/bash"                      "${HOME}/.bash"

  [[ $? ]] \
  && _print_success "bash files symlinked"
}

link_git_files() {
  rm -rf "${HOME}/.gitconfig"

  ln -fs "${PROGDIR}/git/.gitconfig" "${HOME}/.gitconfig"

  [[ $? ]] \
  && _print_success "git files symlinked"
}

link_tmux_files() {
  rm -rf "${HOME}/.tmux.conf"

  ln -fs "${PROGDIR}/conf/tmux/tmux.conf" "${HOME}/.tmux.conf"

  [[ $? ]] \
  && _print_success "tmux files symlinked"
}

source_bash() {
  source "${HOME}/.bash_profile"
  [[ $? ]] \
  && _print_success "bash files sourced"
}
