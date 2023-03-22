# Projectpad

Manage favorite paths and quickly `cd` to them in your shell.

Projectpad keeps a list of your favorite (project) directories and
allows for very quick navigation to those directories in the command
line shell.

Optionally a symlink `~/p` can be used that will point to
the selected path, which can be practical when dealing with
`/very/long/and/deeply/burried/folders/`. The link is updated whenever
you switch projects.

Projectpad and Git combine very-well, you can recursively scan for
git repositories to quickly add them to the selection list. Command
completion support for Bash and Zsh is included.

![demo gif](misc/demo.gif)


## Requirements

- a \*nix bourne (compatible) shell (e.g. sh, ksh, zsh, bash)
- cdialog (installed on most \*nix systems as `dialog`)
  http://freecode.com/projects/cdialog

## Installing

From the source directory, run `make install` with root privileges:

``` shell
$ sudo make install
```

This will install projectpad to /usr/local/bin by default and will also
install the completion file for bash and zsh. If at anytime you want to
get rid of pycommand, you can just run `sudo make uninstall` from the
source directory.

## Using projectpad

You'll never have to cd /home/user/projects/work/projectX again. Well,
ok once maybe, to add the directory to your list. In short, daily usage
will look like this:
- `g` cd to the project/directory you were working on
- `s` pick a directory from your list and immediately cd to it

In your console/shell, change the directory to a 'project' path.
Then add the current directory/project by running:

``` shell
$ projectpad add
```

Then set a project (using a dialog window):

``` shell
$ projectpad set  # or alias 's', see Shell settings
```

Now, whenever you want to change to the project you have 'set', you can
run:

``` shell
$ cd `projectpad get`  # or alias 'g', see Shell settings
```


### Basic shell settings

To quickly change to the project directory (after setting it), it is
advised to set aliases and use them instead of the `get` and `set`
commands directly:

``` shell
alias g='cd `projectpad get`'
alias s='projectpad set && cd `projectpad get`'
```


### Auto scan git repositories and them as projects

To use projectpad with your git repositories, cd to your
parent folder (e.g. `~/projects`) and create a project listing:

``` shell
$ projectpad update
```

This will recursively scan the directory for git repositories.
Of course, you can also add any single git repository this way.


### Keep a symlink in sync with the active project

Projectpad can keep a symbolic link that always points to the active directory,
which can help to greatly shorten long path names in your prompt.

If a variable `${PROJECTPAD_SYMLINK}` is set in the shell, and only then,
projectpad will update the symlink whenever you change projects.

``` shell
export PROJECTPAD_SYMLINK=~/p
alias gg="cd ${PROJECTPAD_SYMLINK}"  # optional
```

Tip! If you add `$(projectpad name)` to your `PS1` prompt, you can
shorten paths names but still be informed about the project that you are
working on.

Tip! Use in combination with
[$CDPATH](http://linux.101hacks.com/cd-command/cdpath/)
for even more lazyness and comfort


### Temporary paths

Use `projectpad pwd` if you want to set $PWD as active path, but don't
want to add it to the list for later selection.


## Command overview

``` shell
$ projectpad help
usage: projectpad <command>

Commands:
   help    Show this help:
   set     Set current project
   add     Add PWD to projects and activate path
   pwd     Set PWD as active path
   edit    Edit project file with EDITOR
   update  Recursively scan PWD for git directories and append any
           found directories to the project file
   gitto   Register all projects with gitto
   name    Get current project name
   get     Get current project path
   version Show version information

If you use a symlink that points to projectpad, the name of that symlink
is used instead of projectpad when printing usage/help information.
```


## License

projectpad is released under a 3-clause BSD License.

SPDX-License-Identifier: BSD-3-Clause

------------------------------------------------------------------------------

Copyright (c) 2012-2023  Benjamin Althues <benjamin@babab.nl>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
