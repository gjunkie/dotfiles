" command! -count Blame call git#BlameCurrentFile(bufnr('%'), expand('%:p'), <f-args>)
