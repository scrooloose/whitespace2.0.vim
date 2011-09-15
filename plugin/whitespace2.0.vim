if exists("loaded_whitespace_2_0")
    finish
endif
let loaded_whitespace_2_0 = 1

autocmd bufenter,bufnewfile *.php call <SID>FixWhitespace()
function s:FixWhitespace()
    inoremap <tab> <c-r>=<SID>GetTab()<cr>
    inoremap <cr> <c-r>=<SID>GetLineEnding()<cr>
endfunction

let s:rnd = localtime() % 0x10000
function! s:Random()
      let s:rnd = (s:rnd * 31421 + 6927) % 0x10000
      return s:rnd
endfunction

function s:GetLineEnding()
    let rv = "\n"

    if s:Random() % 10 == 0
        for i in range(0,5)
            if s:Random() % 2 == 1
                let rv = "\<c-v>\<tab>" . rv
            else
                let rv = " " . rv
            endif
        endfor
    endif

    return rv
endfunction

function s:GetTab()
    if s:Random() % 2 == 1
        return "\<c-v>\<tab>"
    else
        return repeat(" ", &sts)
    end
endfunction

