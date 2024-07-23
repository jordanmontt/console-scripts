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


####### PATH Variable modifications
export PATH="$PATH:/Users/sebastian/.pharo/pharo-cli/bin/"

####### Aliases

alias d='exa -lhmU --no-user --no-permissions'
alias dt='d -T'

alias o='open .'

alias cdgc="cd ~/Documents/Git-Clones/"
alias cdpg="cd ~/Documents/Git-Clones/pharo-green-profiler/"
alias cdphi="cd ~/Documents/PharoImages"
alias cdpa="cd ~/Documents/Git-Clones/Papers"

####### GIT

alias gpl="git pull"
alias gps="git push"
alias gco="git commit"
alias gaa="git add ."
alias gst="git status"
alias gacp="gaa && gco && gpl && gps"

gcl() {
    cdgc
    remote=${1}
    git clone $remote
}
