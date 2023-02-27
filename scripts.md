# My scripts

```bash
####### Theme
ZSH_THEME="refined"

####### Aliases

# Go to my GitHub clones folder
alias cdgc="cd ~/Documents/Git-Clones/"

alias cdphi="cd ~/Documents/Pharo/images"

####### GIT

gclo() {
    cd ~/Documents/Git-Clones/
    remote=${1}
    git clone $remote
}

####### Scripts default Pharo version: Pharo 11

# Open Pharo. Assumes that you have the vm in the same folder
ph() {
    directory=${1}
    if [ -z $directory ]
    then
        echo "You need to send a directory as argument"
    else
        cd "$directory"
        vm='pharo-vm/Pharo.app/Contents/MacOS/Pharo'
        image=$(find . -name "*.image")
        echo 'Opening Pharo: '$(pwd)
        $vm $image
    fi
}

oph() {
    oldLocation=$(pwd)
    cdphi
    # Get image name using fzf
    imageName=$(ls|fzf)
    if [ -z $imageName ]
    then
        echo 'Select an image'
        return -1
    fi
    cd "$imageName"
    ph .
    cd $oldLocation
}

rph() {
    oldLocation=$(pwd)
    cdphi
    # Get image name using fzf
    imageName=$(ls|fzf)
    if [ -z $imageName ]
    then
        echo 'Select an image to remove'
        return -1
    fi
    rm -rf "$imageName"
    cd $oldLocation
}

# Download only Pharo image using zero conf. Receives the image name as parameter. Creates the folder and renames the files
gph() {
    oldLocation=$(pwd)
    # Get arguments
    name=${1}
    if [ -z $name ]
    then
        echo 'Need to specify a name as an argument'
        return -1
    fi
    # Go to the images directory
    cdphi
    # Create and go to new folder
    mkdir $name
    cd $name
    # Download Pharo
    curl -L https://get.pharo.org/64/110+vm | bash
    # Rename files
    echo 'Renaming files to '$name
    mv Pharo.image "$name".image
    mv Pharo.changes "$name".changes
    # Open Pharo
    ph .

    cd $oldLocation
}

####### Pharo Launcher
# Same commands but running the image with the vm that was downloaded by the 

phl() {
    imagePath=${1}
    vm='/Users/sebastian/Documents/Pharo/vms/110-x64/Pharo.app/Contents/MacOS/Pharo'
    if [ -z $imagePath ]
    then
        $vm
    else
        $vm $imagePath
    fi
}

ophl() {
    oldLocation=$(pwd)
    cdphi

    imageName=$(ls|fzf)
    cd "$imageName"
    
    imagePath=$(find . -name "*.image")
    phl $imagePath

    cd $oldLocation
}

###### Scripts Pharo 10

# Same scripts as default Pharo but for Pharo 10

```
