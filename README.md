#gcov-marker

This plugin provides a simple way to load and reload gcov files for an open
source file. It will highlight the covered and uncovered lines and publish
the uncovered lines to the location list.

It does not show you detailed information about the coverage at the moment so
you do not get detailed information like the number of hits or branches.

## Install

- Copy plugin/gcov_marker.vim to ~/.vim/plugin
- Copy autoload/gcov_marker.vim to ~/.vim/autoload
- Copy syntax/gcov_marker.vim to ~/.vim/syntax
- Copy doc/gcov_marker.vim to ~/.vim/doc

## Usage

In the window of your source file, run command
:GcovLoad source.gcov

If *g:gcov_marker_path* contains a folder with all your .gcov files, run
:GcovFind

## Configuration

Default markers can be customized using the variables below.
```vimrc
let g:gcov_marker_covered    = '✓'
let g:gcov_marker_uncovered  = 'X'
```


The *GcovFind* command needs to know where to look for the .gcov files.
There is only one folder allowed, all the .gcov files has to be placed there.
```vimrc
let g:gcov_marker_path  = 'path/to/gcov/files/'
```

By default, the plugin opens the location list once uncovered lines are
published. This behavior can be changed by setting the global variable below.
Note that the uncovered lines will always be published to the location list.
```vimrc
let g:gcov_marker_auto_lopen = 0
```
Command :lopen can be used to display the list of uncovered lines in the location list.
