Download Settings
==============
```
mkdir -p ~/download
git clone https://github.com/gdufsh/vim-settings.git ~/download/vim-settings
```

Link .vim
==============
```
test -d ~/.vim && mv ~/.vim ~/.vim.bak
test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.bak
ln -s ~/download/vim-settings ~/.vim
```

Install Plugins
==============
```
cd ~/.vim
git submodule update --init --recursive
vim -c "PluginInstall"
cd .vim/bundle/YouCompleteMe && ./install.py
GO111MODULE=on go get golang.org/x/tools/gopls@latest
vim -c "GoInstallBinaries"
```

Install Tools
==============
```
apt install ripgrep
pip install flake8
pip install autopep8
pip install yapf
```
