
function! Setcov(filename)
    exe ":sign unplace *"
    for line in readfile(a:filename)
        let d = split(line, ':')
        let c = substitute(d[0], " *", "", "")
        let l = substitute(d[1], " *", "", "")
        if '-' != c && c !~ '#'
            exe ":sign define c" . c . " text=" . c . ""
            exe ":sign place " . l . " line=" . l . " name=c" . c . " file=" . expand("%:p")
        elseif c =~ '#'
            exe ":sign define cd text=# linehl=Special"
            exe ":sign place " . l . " line=" . l . " name=cd file=" . expand("%:p")
        endif
    endfor
    let b:coveragefile = filename
endfunction

function! ReloadCov()
   Setcov(b:coveragefile)
endfunction

function! ClearCov()
    exe ":sign unplace *"
endfunction

command -nargs 1 -complete=file GcovLoad call SetCov(<args>)
command -nargs 0 -complete=file GcovLoad call ReloadCov()
command -nargs 0 -complete=file GcovStop call ClearCov()

