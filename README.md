### Installation Instructions

1. Clone the repository
2. Initiate and clone the   [antigen](https://github.com/zsh-users/antigen) submodule
```bash
cd dotfiles
git submodule init
git submodule update
```
3. Symlink the the dotfiles (assuming the repository is checked out to ~/Projects/dotfiles)
```bash
cd ~
ln -s Projects/dotfiles/.zshrc .
```
