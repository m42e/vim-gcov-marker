function! SetCov(...)
   if(a:0 == 2)
         let filename = a:2
   elseif (a:0 == 1)
      if(a:1 == '!')
         exe ":sign unplace *"
         return
      endif
      if(exists("b:coveragefile") && b:coveragefile != '')
         let filename = b:coveragefile
      else
         echoerr "no file for buffer specified yet"
         return
      endif
   else
      return
   endif
   "Clear previous markers
   exe ":sign unplace *"
   call setloclist(0, [])
   let currentfile = expand('%')
   "Read coverage file (work only without branch coverage at the moment )
   exe ":sign define gcov_covered linehl=GcovCovered text=✓"
   exe ":sign define gcov_uncovered linehl=GcovUncovered text=✘"
   for line in readfile(filename)
      if line =~ ':'
         let d = split(line, ':')
         let c = substitute(d[0], " *", "", "")
         let l = substitute(d[1], " *", "", "")
         if '-' != c && c !~ '#'
            exe ":sign place " . l . " line=" . l . " name=gcov_covered file=" . expand("%:p")
         elseif c =~ '#'
            exe ":sign place " . l . " line=" . l . " name=gcov_uncovered file=" . expand("%:p")
            exe ":laddexpr '".currentfile.":".l.":uncovered'"
         endif
      endif
   endfor
   " Set the coverage file for the current buffer
   let b:coveragefile = fnamemodify(filename, ':p')
   exe ":lopen"
endfunction


command! -bang -nargs=* -complete=file GcovLoad call SetCov('<bang>',<f-args>)

