## Debian and Ubuntu

neovim
```
sudo apt-get install neovim
```
vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
remainder: git need to install some time
``` 
sudo apt install git 
```

also curl

```
sudo apt install curl
```
###Oh My Zsh
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
vi ~/.zshrc
chsh -s $(which zsh)

##git clone
```
~/.config
```
