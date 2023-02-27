```bash
####### Aliases

# Go to my GitHub clones folder
alias cdgc="cd ~/Documents/Git-Clones/"

alias cdphi="cd ~/Documents/Pharo/images"

####### Scripts Pharo 11

# Open default Pharo, if no image, run the vm
ph() {
    var=${1}
    vm='~/Documents/Pharo/vms/110-x64/Pharo.app/Contents/MacOS/Pharo'
    if [ -z $var ]
    then
        $vm
    else
        $vm $var
    fi
}

# Open defalt Pharo with the selected image name
oph() {
    oldLocation=$(pwd)

    cdphi

    imageName=$(ls|fzf)
    cd "$imageName"
    
    imageNameWithExtension=$(find . -name "*.image")
    ph $imageNameWithExtension

    cd $oldLocation
}

# Download full Pharo using zero conf
gphf() {
    curl -L https://get.pharo.org/64/110+vm | bash
}

# Download only Pharo image using zero conf. Receives the image name as parameter. Creates the folder and renames the files
gph() {
    oldLocation=$(pwd)

    # Go to the images directory
    cdphi
    # Get arguments
    name=${1}
    # Create and go to new folder
    mkdir $name
    cd $name
    # Download Pharo
    curl -L https://get.pharo.org/64/110 | bash
    # Rename files
    mv Pharo.image "$name".image
    mv Pharo.changes "$name".changes
    # Open Pharo
    ph "$name".image

    cd $oldLocation
}

###### Scripts Pharo 10

# Same scripts as default Pharo but for Pharo 10

ph10() {
var=${1}
if [ -z "$var" ]
then
      /Users/sebastian/Documents/Pharo/vms/100-x64/Pharo.app/Contents/MacOS/Pharo
else
      /Users/sebastian/Documents/Pharo/vms/100-x64/Pharo.app/Contents/MacOS/Pharo $var
fi
}

oph10() {
    cdphi

    imageName=$(ls|fzf)
    cd "$imageName"
    
    imageNameWithExtension=$(find . -name "*.image")
    ph10 $imageNameWithExtension
}

gph10() {
    oldLocation=$(pwd)

    # Go to the images directory
    cdphi
    # Get arguments
    name=${1}
    # Create and go to new folder
    mkdir $name
    cd $name
    # Download Pharo
    curl -L https://get.pharo.org/64/100 | bash
    # Rename files
    mv Pharo.image "$name".image
    mv Pharo.changes "$name".changes
    # Open Pharo
    ph "$name".image

    cd $oldLocation
}

```
