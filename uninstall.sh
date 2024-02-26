#! /bin/sh

function uninstall_and_restore () {
    if [ -a $2.bak ]; then
        rm $2
        mv $2.bak $2
        if [ $? -eq 0 ]; then
            echo "Restored backup $2.bak -> $2"
        fi
    else
        echo "No backup found for $2"
    fi
}

# get the installer directory
INSRALLER_DIR=$(dirname $(readlink -f $0))

IFS=$'\n'
for dot in $(cat $INSRALLER_DIR/dots); do
    SRC_PATH=$(echo $dot | awk '{ print $1 }')
    DST_PATH=$(echo $dot | awk '{ print $2 }')
    eval uninstall_and_restore "$SRC_PATH" "$DST_PATH"
done