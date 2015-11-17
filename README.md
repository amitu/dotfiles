Features | Change log
=====================

vim: show space etc, and mark long lines
----------------------------------------

Space is shown as ., and tab as some other char.

Also lines longer than 80 char will have trailing parts shown in red.

vim: keyboard shortcuts
---------------------

LEADER: ,

LADER SPACE: remove all highlights.

LEADER 1: toggle numbering

LEADER l: toggle numbering style

LEADER m: run make (with no argument)

jk: Esc

SPACE: za (toggle fold)

Q: reflow para

;: :

git: .gitignore
---------------

Bunch of files we normally ignore.

git: git-config
---------------

Name, email and `push.default simple`.

zsh: CDPATH
-----------

`cd TAB` will show folders from current folder, from home, from ~/projects
and from ~/coverfox.

zsh: .venv
----------

`.venv` in a filder, it can contain the name of virtual env, and
on CDing into it, it will get auto activated, and CDing out of it will
deactivate it.

Create a new virtual env using the command `mkvirtualenv`.

All virtual envs go in ~/.virtualenvs/$NAME.

zsh: pip only in virtualenvs
----------------------------

`pip` will fail if no virtuan env is active. To insall something globally
use `gpip` instead.
