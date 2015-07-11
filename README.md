# Projectpad

Projectpad is a shell utility for managing paths to project/git
directories.

Here is a mini screencast where the following is done:

 1. A project list is automatically created by scanning for git
    repositories in a folder `~/git`.
 2. Immediately after that, the project list is edited
    (in your favorite editor).
 3. Setting the current project to 'gitto' and cd'ing to it using the
    `gotoproject` alias.
 3. Setting the current project to 'smti' and cd'ing to it using the
    `gotoproject` alias.

![projectpad-mini-screencast](http://i.imgur.com/VbIWskG.gif)


## Requirements

- a \*nix bourne (compatible) shell (e.g. sh, ksh, zsh, bash)
- cdialog (installed on most \*nix systems as `dialog`)
  http://freecode.com/projects/cdialog

## Installing

Run '`make install`' as root:

    $ sudo make install

## Using projectpad

In your console/shell, change the directory to a 'project' path.
Then add the current directory/project by running:

    $ projectpad add

Then set a project (using a dialog window):

    $ projectpad set  # or alias 's', see Shell settings

Now, whenever you want to change to the project you have 'set', you can
run:

    $ cd `projectpad get`  # or alias 'g', see Shell settings

### Shell settings

To quickly change to the project directory (after setting it), it is
advised to set aliases and use them instead of the `get` and `set`
commands directly:

    alias g='cd `projectpad get`'
    alias s='projectpad set && cd `projectpad get`'

### Auto scan git repositories and them as projects

To use projectpad with your git repositories, cd to your
parent folder (e.g. `~/projects`) and create a project listing:

    $ projectpad update

This will recursively scan the directory for git repositories.
Of course, you can also add any single git repository this way.

### Temporary paths

Use `projectpad pwd` if you want to set $PWD as active path, but don't
want to add it.


## Command overview

    usage: projectpad <command>

    Commands:
       help    Show this help:
       set     Set current project
       add     Add $PWD to projects and activate path
       pwd     Set $PWD as active path
       edit    Edit project file with $EDITOR
       update  Recursively scan $PWD for git directories and append any
               found directories to the project file, immediately
               editing it afterwards
       gitto   Register all projects with gitto
       name    Get current project name
       get     Get current project path
       version Show version information

## License

Copyright (c) 2012-2015 Benjamin Althues <benjamin@babab.nl>

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
