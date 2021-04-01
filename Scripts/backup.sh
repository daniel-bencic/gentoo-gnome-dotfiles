#!/bin/bash
if [ $(id -u) -ne 0 ]; then
	1>&2 echo "Script must be run as root user."
	exit 1
fi

case "$1" in
	backup)
		SOURCE=/
		DEST=$2
		MESSAGE="Creating backup of $SOURCE. Storing in $DEST."
		;;
	restore)
		SOURCE=$2
		DEST=/
		MESSAGE="Restoring $DEST. Using backup $SOURCE."
		;;
esac

if [ ! -d $SOURCE ]; then
	1>&2 echo "Source directory $SOURCE does not exist."
	exit 1
fi

if [ ! -d $DEST ]; then
	1>&2 echo "Destination directory $DEST does not exist."
	exit 1
fi

echo $MESSAGE
rsync -aHAXv --exclude={"/dev","/lost+found","/media","/mnt","/proc","/run","/sys","/tmp","$DEST"} $SOURCE $DEST
