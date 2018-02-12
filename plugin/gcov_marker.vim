if exists('g:loaded_gcov_marker') || &cp || version < 700
    finish
endif

command! -bang -nargs=* -complete=file GcovLoad call gcov_marker#SetCov('<bang>',<f-args>)

let g:loaded_gcov_marker = 1
