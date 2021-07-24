" Main .vimrc
" ---------------------------------

runtime config/bundles.vim
runtime config/settings.vim
runtime config/mappings.vim
runtime config/autocmd.vim

call SourceIfExists("~/.work_settings.vim")
