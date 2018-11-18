
" Set File Types
autocmd BufNewFile,BufRead *.html setfiletype html
autocmd BufNewFile,BufRead *.hbs setfiletype html
autocmd BufNewFile,BufRead *.haml setfiletype html
autocmd BufNewFile,BufRead *.jst setfiletype html
autocmd BufNewFile,BufRead *.master setfiletype html
autocmd BufNewFile,BufRead *.aspx setfiletype html
autocmd BufNewFile,BufRead *.ascx setfiletype html
autocmd BufNewFile,BufRead *.ejs setfiletype html
autocmd BufNewFile,BufRead *.jsx set ft=javascript
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd BufNewFile,BufRead *.less setlocal ft=less
autocmd BufNewFile,BufRead *.txt setlocal ft=rst

" To Dos
autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=js
augroup END

autocmd FileType javascript setlocal makeprg=lint\ --format\ compact
autocmd BufWritePost *.py,*.js silent make! <afile> | silent redraw!
autocmd QuickFixCmdPost [^l]* cwindow

" ColorScheme runs after the colorscheme has been loaded
autocmd ColorScheme *
  \ hi User1 ctermfg=001 |
  \ hi User2 ctermfg=002 |
  \ hi User3 ctermfg=003 |
  \ hi User4 ctermfg=004 |
  \ hi User5 ctermfg=005 |
  \ hi User6 ctermfg=006 |
  \ hi User7 ctermfg=007 |
  \ hi User8 ctermfg=008 |
  \ hi User9 ctermfg=009 
