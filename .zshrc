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
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
  
## NIX specific profile
  if [ -d /nix/ ]; then
    . ~/.nix-profile/etc/profile.d/nix.sh
    export VIRTUALENVWRAPPER_PYTHON=~/.nix-profile/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV=~/.nix-profile/bin/virtualenv
  else 
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  fi
fi

antigen theme ~/Projects/dotfiles/themes custom_candy

antigen apply

# Environment variables for virtualenvwrapper for python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects

## check for virtualenvwrapper in nix
if [ -d /nix/ ]; then
  source ~/.nix-profile/bin/virtualenvwrapper.sh
else
  source /usr/local/bin/virtualenvwrapper.sh
fi

if [[ `uname` == 'Linux' ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
fi
# GOLANG variables
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=~/Projects/go
