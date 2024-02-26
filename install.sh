#! /bin/sh

function backup_and_install () {
    mkdir -p $(dirname $2)
    if [ -a $2 ]; then
        if [ ! -L $2 ]; then
            mv $2 $2.bak
        else
            rm $2
        fi
    fi
    ln -s $1 $2
    if [ $? -eq 0 ]; then
        echo "Created symlink $2 -> $1"
    fi
}

# get the installer directory
INSRALLER_DIR=$(dirname $(readlink -f $0))

IFS=$'\n'
for dot in $(cat $INSRALLER_DIR/dots); do
    SRC_PATH=$(echo $dot | awk '{ print $1 }')
    DST_PATH=$(echo $dot | awk '{ print $2 }')
    eval backup_and_install "$SRC_PATH" "$DST_PATH"
done