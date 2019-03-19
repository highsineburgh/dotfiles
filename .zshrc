source ~/Projects/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv
antigen bundle golang

# SSH
#antigen bundle ssh-agent

# Blackbox
antigen bundle StackExchange/blackbox

# Vagrant
antigen bundle vagrant

# OSX Specifc
if [[ `uname` == 'Darwin' ]]; then
  antigen bundle osx
  antigen bundle brew
  # antigen bundle brew-cask
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  export PATH=$PATH:/usr/local/bin/
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
  
## NIX specific profile
  if [ -d /nix/ ]; then
    . ~/.nix-profile/etc/profile.d/nix.sh
  fi
fi

antigen theme ~/Projects/dotfiles/themes custom_candy

antigen apply

# Environment variables for virtualenvwrapper for python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

if [[ `uname` == 'Linux' ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
fi
# GOLANG variables
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=~/Projects/go
