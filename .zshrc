source $(brew --prefix antigen)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme
antigen theme robbyrussell

# Tell Antigen that you're done
antigen apply

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH="$ANDROID_HOME/platform-tools:$PATH"