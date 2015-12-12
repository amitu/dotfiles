OHMYZSH="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
all: update 

update:
	make clean
	make install

install: ~/.vim ~/.vimrc ~/.zshrc ~/.gitconfig ~/.gitignore ~/.oh-my-zsh \
	~/.gitignore ~/.githelpers ~/.emacs.d

~/.vim:
	ln -s `pwd`/vim ~/.vim

~/.vimrc:
	ln `pwd`/vimrc ~/.vimrc

~/.zshrc:
	ln `pwd`/zshrc ~/.zshrc

~/.gitconfig:
	ln `pwd`/gitconfig ~/.gitconfig

~/.githelpers:
	ln `pwd`/githelpers ~/.githelpers

~/.gitignore:
	ln `pwd`/gitignore ~/.gitignore

~/.oh-my-zsh:
	sh -c "$(curl -fsSL ${OHMYZSH})"

~/.emacs.d:
	ln -s `pwd`/emacs.d ~/.emacs.d

clean:
	-@rm ~/.emacs.d
	-@rm ~/.emacs
	-@rm ~/.vim
	-@rm ~/.vimrc
	-@rm ~/.zshrc
	-@rm ~/.githelpers
	-@rm ~/.gitconfig
	-@rm ~/.gitignore

brew:
	brew install git tree unrar wget zsh cask htop
	brew install redis
	brew install go node python pyenv pyenv-virtualenv
	bre install emacs macvim GhostScript pandoc
	brew cask install iterm2 google-chrome firefox vlc flux utorrent
	brew cask install tunnelblick slack

