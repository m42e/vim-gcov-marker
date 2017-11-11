#gcov-marker

This plugin provides a simple way to load and reload gcov files for an open
source file. It will highlight the covered and uncovered lines and publish
the uncovered lines to the location list.

It does not show you detailed information about the coverage at the moment so
you do not get detailed information like the number of hits or branches.

## Install

Copy plugin/gcov_marker.vim to ~/.vim/plugin
Copy autoload/gcov_marker.vim to ~/.vim/autoload
Copy syntax/gcov_marker.vim to ~/.vim/syntax
Copy doc/gcov_marker.vim to ~/.vim/doc

## Usage

In the window of your source file, run command
:GcovLoad source.gcov
