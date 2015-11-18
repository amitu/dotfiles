OHMYZSH="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
all: update 

update:
	make clean
	make install

install: ~/.vim ~/.vimrc ~/.zshrc ~/.gitconfig ~/.gitignore ~/.oh-my-zsh \
	~/.gitignore ~/.githelpers

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

clean:
	-@rm ~/.vim
	-@rm ~/.vimrc
	-@rm ~/.zshrc
	-@rm ~/.githelpers
	-@rm ~/.gitconfig
	-@rm ~/.gitignore

brew:
	brew install git redis go node tree unrar wget zsh cask python
	brew cask install iterm2 google-chrome firefox vlc flux
