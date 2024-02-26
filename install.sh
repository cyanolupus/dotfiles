#! /bin/sh

backup_and_install () {
    mkdir -p $(dirname $2)
    if test -e $2; then
        if test ! -L $2 ; then
            if test -e $2.bak; then
                mv $2.bak $2.$(date +%Y%m%d%H%M%S).bak
            fi
            mv $2 $2.bak
        else
            rm $2
        fi
    fi
    ln -s $1 $2
    if test $? -eq 0; then
        echo "Created symlink $2 -> $1"
    fi
}

# get the installer directory
INSRALLER_DIR=$(dirname $(readlink -f $0))

IFS='
'
for dot in $(cat $INSRALLER_DIR/dots); do
    SRC_PATH=$(echo $dot | awk '{ print $1 }')
    DST_PATH=$(echo $dot | awk '{ print $2 }')
    eval backup_and_install "$SRC_PATH" "$DST_PATH"
done