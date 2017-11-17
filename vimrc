
" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ${HOME}/.vim/settings/bundles.vim
call vundle#end()

" Plugin Settings
source ${HOME}/.vim/settings/airline.vim
source ${HOME}/.vim/settings/ale.vim
source ${HOME}/.vim/settings/ctrlp.vim
source ${HOME}/.vim/settings/fzf.vim
source ${HOME}/.vim/settings/nerdtree.vim
source ${HOME}/.vim/settings/toggle.vim
source ${HOME}/.vim/settings/undotree.vim
" Settings
source ${HOME}/.vim/settings/color.vim
source ${HOME}/.vim/settings/mappings.vim
source ${HOME}/.vim/settings/settings.vim

filetype plugin indent on

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" GIT
"let g:git_branch_status_head_current=1 
"let g:git_branch_status_nogit=""
"let g:git_branch_status_text=" " 
"let g:git_branch_status_ignore_remotes=1

au FileType * IndentGuidesEnable
