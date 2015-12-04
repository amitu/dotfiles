Features | Change log
=====================

emacs: helm
-----------

C-t in helm mode will cycle the location of helm window.

C-c C-i: insert the current selection into the buffer, good for inserting file
names in buffer.

M-x gets helm mode, C-x f gets helm mode, C-x b gets helm mode!

Buffer mode: @foo will search for all buffers that contain foo.

C-x s: Search in different files.

C-x S: find files.

C-x O: helmTAB: temp move to position occur (find patter in this file).

C-x l: locate, using system locate, searches on all files in system.

On mac, if you have not done this already, you will have to do this once:

```shell
$ sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```

Much more: http://tuhdo.github.io/helm-intro.html

emacs: highlight current line
-----------------------------

```elisp
(global-hl-line-mode)
```

emacs: fixed scrolling behaviour
--------------------------------

Smooth touchpage scrolling etc. C-up/down and M-up/down for quick keyboard
scroll.

emacs: projectile
-----------------

Command-f, C-c f: list files in current "project".

Ctrl-u Command-f: clear cache and list files.

Command-P, C-c p p: switch projects.

emacs: magit
------------

C-c s: git status.

C-c d: unstaged diff

C-c D: staged diff

C-c C-d: uncommmitted diff

Magit status major mode:

C-c C-c c: commit

C-c C-c P: push

emacs: show startup time
------------------------

Time to load emacs is shown when emacs starts.

zsh: cdls
---------

On `cd` it does a `ls`.

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
