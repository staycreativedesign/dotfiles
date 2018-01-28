# My setup for re-installs
## Mac OSX user / Vim user
xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/
install)"

#zsh

brew install zsh

sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

sudo chown -R $(whoami):admin /usr/local

ln -s ~/dotfiles/.oh-my-zsh ~/

#git

brew install git

ln ~/dotfiles/.gitignore ~/

git config --global credential.helper osxkeychain

#powerlinefonts

git clone https://github.com/powerline/fonts.git --depth=1

cd fonts

./install.sh

cd ~/

rm -rf fonts

brew install postgres

brew install yarn

brew install redis

brew install fzf

brew install python3

brew install vim

brew install reattach-to-user-namespace

brew install make

brew install node

brew install gpg

brew install the_silver_searcher

brew install tmux

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle/YouCompleteMe

./install.py --clang-completer

#tmux
ln -s ~/dotfiles/.tmux/.tmux.conf ~/

ln -s ~/dotfiles/.tmux/.tmux.conf.local ~/

#gemrc

ln -s ~/dotfiles/.gemrc ~/

#rvm

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable --ruby

#source /Users/mindblown/.rvm/scripts/rvm
#browserify

npm install -g browserify

#tmuxinator

gem install tmuxinator

#motivate

ln -s ~/dotfiles/.motivate ~/

#ngrok

# cd into your local bin directory
#cd /usr/local/bin

# create symlink
#ln -s /Applications/ngrok ngrok


#https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

#https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

#https://help.dreamhost.com/hc/en-us/articles/216499537-How-to-configure-passwordless-login-in-Mac-OS-X-and-Linux

#https://superuser.com/questions/399360/shortcut-for-login-to-remote-computer-via-ssh




