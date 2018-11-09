" Mucomplete settings
" ---------------------------------
set completeopt+=menu,menuone,noinsert,noselect

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#popup_direction = { 'keyp' : 1, 'keyn' : 1 }

" Ccompletion Chains
" ---------------------------------
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['user', 'c-n']
let g:mucomplete#chains.js = ['user', 'c-n']
let g:mucomplete#chains.coffee = ['user', 'c-n']
let g:mucomplete#chains.markdown = ['keyn', 'spel', 'dict']
