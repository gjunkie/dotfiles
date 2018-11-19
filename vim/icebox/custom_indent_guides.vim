
function! MyPoorIndentGuide(clear)
    if !exists("w:ids")
        let w:ids=[]
    endif
    if a:clear
        call map(w:ids, 'matchdelete(v:val)')
        unlet! w:ids
        return
    endif
    hi HiTabs ctermfg=red guibg=red ctermbg=red
    hi HiSpaces2 ctermfg=blue guibg=blue ctermbg=blue
    hi HiSpaces6 ctermfg=yellow guibg=yellow ctermbg=yellow
    hi HiSpaces9 ctermfg=green guibg=green ctermbg=green
    call add(w:ids, matchadd('HiTabs', '\t'))
    for i in range(3, 9, 3)
        exe printf("call add(w:ids, matchadd('HiSpaces%d', '\\s\\{%d\\}', %d))", i, i, i+10)
    endfor
endfunction

function! ToggleIndentGuides()
    if !exists('#MyIndentGuideGroup')
        augroup MyIndentGuideGroup
            au!
            au WinEnter * call MyPoorIndentGuide(0)
        augroup end
        call MyPoorIndentGuide(0)
    else
        augroup MyIndentGuideGroup
            au!
        augroup end
        augroup! MyIndentGuideGroup
        call MyPoorIndentGuide(1)
    endif
endfunction

com! MyIndentGuideToggle :call ToggleIndentGuides()
