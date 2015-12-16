Features | Change log
=====================


emacs: elpy
-------------

deactivated anaconda etc and using elpy. flymake thing works (once right
virtualenv is activated using pyenv-activate).

C-c C-n/p: go to next/prev pyflake error.



emacs: avy (ace jump replacement)
--------------------------------------

Super-l: jump to line

Super-L: jump to word

Both above asks for one character, and mark lines or words starting with that
character in buffer with one or few characters, which when typed jumps the
cursor to appropriate line or word.



emacs: yasnippets
-----------------

Imported
[yasnippets-snippets](https://github.com/AndreaCrotti/yasnippet-snippets) as
git submodule.

Hyper-i: list all available snippets for this mode.

Hyper-I: list all snippets and their keys etc.

Hyper-k: kill other window's buffer (without killing other window, for getting
rid of temporary output buffers opened by some commands).

Autocompletion is still M-/.



emacs: hyper
------------

fn key on mac now becomes hyper key for emacs. Some binds are being added to it
eg H-l: helm-locate.



emacs: elfeed, read RSS feed
----------------------------

C-x w: open feed reader.

g: refresh list (hide read ones)

G: update from server

s: update search field.

b: open selected entry in browser.

y: copy url.

r: mark entry read

u: makr entry unread

+: add tag

-: remove tag



emacs: multi-term
-----------------

Added multi-term, for now invoke it using M-x multi-term.

C-c t, Super-Shift-left, Super-Shift-right: switch to next terminal

C-c C-t: create a new terminal

C-c C-j: line mode, this is where you want to be 90% of times (C-c C-c sends
C-c).

C-c C-k: char mode, this is needed for pasting things.

This as of now is quite dangerous, rm -rf ~/projects/ then paste tmp, and it
will show "rm -rf ~/projects/tmp" but will actually execute "rm -rf
~/projects".



emacs minor stuff
------------------

Ensure there is newline in end of file.

Backups are stored in ~/.emacs.d/backups.

Highlight closing parenthesis.

saveplace: Saves location of cursor when emacs quits or buffer is killed, and
when opening the file next it moves to last saved point.

C-h after any key prefix to see what all key bindings are available.

Super-left: switch to previous window.

Super-right: switch to next window.

Super-b: Switch buffers.

Super-x: Meta-x.

Ctrl-o/Ctrl-Shift-o: works as expected (open a line below/above).

Ctrl-a: works as expected (beginning of indentation or line).

Ctrl-e: end of current line, and subsequent ones when repeated.

Super-Shift-L: go to last edit.

C-c w: toggle whitespace mode.

Activated guide key mode. Pressing C-x or C-c etc will show a menu after a
short interval, showing available keys, and the command they are mapped to.

C-c b: swith to previous buffer.

M-j: join next line with the current one

Super-1: delete other windows.

Added htmlize package. No keyboard shortcuts, activte using M-x html...

emacs: helm
-----------

C-t in helm mode will cycle the location of helm window.

C-c C-i: insert the current selection into the buffer, good for inserting file
names in buffer.

M-x gets helm mode, C-x f gets helm mode, C-x b gets helm mode!

M-y: kill ring helmified.

Buffer mode: @foo will search for all buffers that contain foo.

Super-g, C-x s: Search in different files.

C-x S: find files.

C-x c b: helm-resume (resume last helm session).

C-u C-x c b: helm-resume-pick which one to resume.

C-x O: helmTAB: temp move to position occur (find patter in this file).

Super-Shift-SPACE, C-h SPACE: mark ring, show all marks, local and global.

C-x c t: helm-top. F4-F1: kill with increasing severity. C-c C-u:
refresh, M-p: sort by CPU usage, M-C: short by command, M-U: sort by
user, M-M: short by memory.

C-c C-l: in eshell uses helm over command history.

Super-i: imenu!

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

C-c s, Super-m: git status.

C-c d, Super-d: unstaged diff

C-c D, Super-D: staged diff

C-c C-d, Super-e: uncommmitted diff

C-c r: refresh gutter for git stuff, if it does not auto refresh.

Magit status major mode:

i: ignore the current file (adds to .gitignore)

g: refresh the status buffer

s: stage the current file or hunk

Tab: show/hide diff for current file/hunk

c: commit

P: push

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
