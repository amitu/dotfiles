all: install

install:
	cp -rf .vim ~
	cp .vimrc ~
	cp .zshrc ~
	cp .githelpers ~
	cp .gitconfig ~
	cp .gitignore ~

