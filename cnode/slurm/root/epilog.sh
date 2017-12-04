#!/bin/bash
echo "User ID: $SLURM_JOB_USER" >> /tmp/epilog.txt

[ "$SLURM_JOB_USER" == "root" ] && exit 0

if [ ! -z $SLURM_JOB_USER ]; then
	rm -fR /home/$SLURM_JOB_USER/*
	echo "home depurado exitosamente" >> /tmp/epilog.txt
else
	echo "No se depura el home" >> /tmp/epilog.txt
	exit 1
fi

exit 0
