all: install

install:
	cp -rf .vim ~
	cp .vimrc ~
	cp .zshrc ~
	cp .githelpers ~
	cp .gitconfig ~
	cp .gitignore ~

brew:
	brew install git redis go node tree unrar wget zsh cask python
	brew cask install iterm2 google-chrome firefox vlc flux
