# Projectpad

Projectpad is a simple shell script for managing paths to (software) projects.

## Requirements

- cdialog (installed on most \*nix systems as `dialog`)
  http://freecode.com/projects/cdialog

## Installing

Make sure projectpad has execution rights.

    $ chmod +x projectpad

Place it somewhere in your `PATH`.

    $ cp projecpad ~/bin/

I prefer to place 'foreign' shell scripts in my `$HOME/bin`, another good
location could be `/usr/local/bin/` if `$HOME/bin` is not in your `$PATH`.

    $ sudo cp projectpad /usr/local/bin/

## Using Projectpad

    USAGE: projectpad <command>

    Set aliases to quickly change to project path, like so:

        alias gotoproject='cd `projectpad get`'
        alias setproject='projectpad set && cd `projectpad get`'

    Commands:

    help    Show this help:
    edit    Edit project file with $EDITOR
    get     Get current project path
    set     Set current project

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
