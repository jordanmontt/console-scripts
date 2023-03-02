####### Configuration

### Necessary because .zshrc and .zsh_history are inside the .zsh/ folder
# ZSH HOME
export ZSH=$HOME/.zsh

# ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

### Custom themes and plugins

# ~ .zsh/themes: git clone git@github.com:spaceship-prompt/spaceship-prompt.git
source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
# ~/.zsh/plugins: git clone git@github.com:zsh-users/zsh-autosuggestions.git
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# ~/.zsh/plugins: git clone git@github.com:zdharma-zmirror/fast-syntax-highlighting.git
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

####### Aliases

# Go to my GitHub clones folder
alias ls='ls -GFh'
alias cdgc="cd ~/Documents/Git-Clones/"

####### GIT

alias gpl="git pull"
alias gps="git push"
alias gco="git commit"
alias gaa="git add ."
alias gst="git status"

gcl() {
    cdgc
    remote=${1}
    git clone $remote
}