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
pip install flake8
```
