
####### Theme
ZSH_THEME="refined"

####### Aliases

# Go to my GitHub clones folder
alias cdgc="cd ~/Documents/Git-Clones/"

####### GIT

gclo() {
    cd ~/Documents/Git-Clones/
    remote=${1}
    git clone $remote
}

## Pharo scripts are in pharo.sh