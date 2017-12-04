#!/bin/sh
echo "User ID: $SLURM_JOB_USER" >> /tmp/prolog.log

[ "$SLURM_JOB_USER" == "root" ] && exit 0

if [ ! -z $SLURM_JOB_USER ]; then
	rsync -av --delete root@admnode:/home/$SLURM_JOB_USER/ /home/$SLURM_JOB_USER/
	echo "home sincronizado" >> /tmp/prolog.log
else
        echo "No se sincroniza el home" >> /tmp/prolog.log
	exit 1
fi

exit 0
