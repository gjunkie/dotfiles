" Custom Snippets
" -------------------------

inoremap *fun const foo = () {<CR>};<Up><Right><Right><Right><Right><Right><Esc>
inoremap *log console.log('%c ', 'background: #222; color: #bada55');<Esc>0 15<Right>
nnoremap CL console.log('%c 'getreg("0"), 'background: #222; color: #bada55');<Esc>0 15<Right>

