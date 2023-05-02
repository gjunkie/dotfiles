" AutoCmds
" ---------------------------------

" Set File Types
autocmd BufNewFile,BufRead *.html setfiletype html
autocmd BufNewFile,BufRead *.hbs setfiletype html
autocmd BufNewFile,BufRead *.haml setfiletype html
autocmd BufNewFile,BufRead *.jst setfiletype html
autocmd BufNewFile,BufRead *.master setfiletype html
autocmd BufNewFile,BufRead *.aspx setfiletype html autocmd BufNewFile,BufRead *.ascx setfiletype html
autocmd BufNewFile,BufRead *.ejs setfiletype html
autocmd BufNewFile,BufRead *.json setlocal ft=json
autocmd BufNewFile,BufRead *.less setlocal ft=less
autocmd BufNewFile,BufRead *.txt setlocal ft=rst
" autocmd BufNewFile,BufRead *.jsx setlocal ft=javascript
autocmd BufNewFile,BufRead *.thrift setlocal ft=java
autocmd BufNewFile,BufRead *.strato setlocal ft=strato

" Javascript
autocmd bufnewfile,bufread *.tsx set filetype=typescriptreact
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd bufnewfile,bufread *.js set filetype=javascript.jsx
augroup filetype javascript syntax=javascript

" Native linting using quickfix
" augroup Linting
" 	autocmd!
  " autocmd FileType javascript setlocal makeprg=eslint\ --format\ "table" --no-eslintrc\ compact
"   autocmd FileType javascript.jsx setlocal makeprg=eslint\ --no-eslintrc\ --format\ "stylish"
"   autocmd BufWritePost *.js silent make! <afile> | silent redraw!
"   autocmd QuickFixCmdPost * cwindow
" augroup END
" 
" fun! s:highlight()
"   hi User1 ctermfg=16
" 
"   hi User2 ctermfg=16
"   hi User2 ctermbg=195
" 
"   hi User3 ctermfg=195
" 
"   hi User4 ctermfg=004
" 
"   hi User5 ctermfg=005
" 
"   hi User6 ctermfg=195
" 
"   hi User7 ctermfg=none
" 
"   hi User8 ctermfg=214
" 
"   hi User9 ctermfg=202
" endfun
" " 
" " ColorScheme runs after the colorscheme has been loaded
" augroup run_highlight
"   autocmd!
"   autocmd ColorScheme * call s:highlight()
" augroup end
" 
" call s:highlight()

" augroup CleanBuffers
"   autocmd!
"   autocmd BufLeave * execute CleanNoNameEmptyBuffers()
" augroup END

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
augroup END

"-----------------------------------------------------------------------------
" Helpful general settings
"-----------------------------------------------------------------------------
" Needed for compltions _only_ if you aren't using completion-nvim
autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
let g:tig_executable = 'tig'
let g:tig_on_exit = 'bw!'
