# Projectpad

Projectpad is a shell utility for managing paths to project/git
directories.

## Requirements

- a \*nix bourne (compatible) shell (e.g. sh, ksh, zsh, bash)
- cdialog (installed on most \*nix systems as `dialog`)
  http://freecode.com/projects/cdialog

## Installing

Run 'make install' as root:

    # make install

## Using Projectpad

Usage:

    usage: projectpad <command>

    Commands:
       help    Show this help:
       edit    Edit project file with $EDITOR
       get     Get current project path
       name    Get current project name
       set     Set current project
       update  Recursively scan PWD for git directories and append any
               found directories to the project file, immediately
               editing it afterwards
       gitto   Register all projects with gitto

To quickly start using projectpad for your git repositories, cd to your
parent folder (e.g. `~/git`) and create a project listing:

    $ projectpad update

Then set a project (using a dialog window):

    $ projectpad set

Now, whenever you want to change to the project you have 'set', you can
run:

    $ cd `projectpad get`

To quickly change to the project directory (after setting it), it is
advised to set the following aliases and use these instead of the get
and set commands directly:

    alias gotoproject='cd `projectpad get`'
    alias setproject='projectpad set && cd `projectpad get`'

## License

Copyright (c) 2012-2013 Benjamin Althues <benjamin@babab.nl>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
