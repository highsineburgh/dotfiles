source ~/Projects/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library. 
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# SSH
antigen bundle ssh-agent

# Blackbox
antigen bundle StackExchange/blackbox

# Vagrant
antigen bundle vagrant

antigen theme candy

antigen apply
