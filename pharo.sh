# Configuration
#!/bin/bash

### Variables

pharo_images_location='~/Documents/Pharo/images'
default_pharo_version=11

### Aliases

alias cdphi="cd $pharo_images_location"

### Private functions

open_pharo_() {
    directory=${1}
    if [ -z $directory ]; then
        echo "Error, you need to send an image directory as argument"
    else
        cd "$directory"
        local_vm='pharo-vm/Pharo.app/Contents/MacOS/Pharo'
        image=$(find . -name "*.image")
        echo 'Opening Pharo in location: '$(pwd)
        $local_vm $image
    fi
}

oph() {
    old_location=$(pwd)

    cdphi
    # FZF is a library that support fuzze search and other cool features for string matching
    image_name=$(ls | fzf)
    if [ -z $image_name ]; then
        return -1
    fi
    cd "$image_name"
    open_pharo_ .

    cd $old_location
}

rph() {
    old_location=$(pwd)

    cdphi
    # fzf is a library that support fuzze search and other cool features for string matching
    image_name=$(ls | fzf)
    if [ -z $image_name ]; then
        return -1
    fi

    echo "Are you sure that you want to delete ${image_name} y/n?"
    read choice
    case "$choice" in
    y | Y) rm -rf "$image_name" && echo "Image ${image_name} deleted successfully" ;;
    *) echo "Canceling" ;;
    esac

    cd $old_location
}

# Download only Pharo image using zero conf. Image name optional parameter. Creates the folder and renames the files
gph() {
    oldLocation=$(pwd)

    # Pharo version to download
    pharo_version=${1}
    if [ -z $pharo_version ]; then
        pharo_version=$default_pharo_version
    fi

    #Getting image name
    echo 'Enter an image name:'
    read name
    if [ -z $name ]; then
        return -1
    fi

    # Creating folder
    cdphi
    mkdir $name
    cd $name

    # Download Pharo
    link_to_download="https://get.pharo.org/64/${pharo_version}0+vm"
    curl -L $link_to_download | bash

    # Rename files to name
    echo 'Renaming files to '$name
    mv Pharo.image "$name".image
    mv Pharo.changes "$name".changes

    # Open Pharo
    open_pharo_ .

    cd $oldLocation
}

####### Pharo Launcher
# Same commands but running the image with the vm that was downloaded by the

phl() {
    image_path=${1}
    pharo_launcher_vm='/Users/sebastian/Documents/Pharo/vms/110-x64/Pharo.app/Contents/MacOS/Pharo'
    if [ -z $image_path ]; then
        echo "Error, need to send an image path as argument"
    else
        $pharo_launcher_vm $image_path
    fi
}

ophl() {
    old_location=$(pwd)

    cdphi
    image_name=$(ls | fzf)
    if [ -z $image_name ]; then
        cd $old_location
        return -1
    fi
    cd "$image_name"
    image_path=$(find . -name "*.image")
    phl $image_path

    cd $old_location
}

###### Scripts Pharo 10

# Same scripts as default Pharo but for Pharo 10
