#!/usr/bin/env bash
df -Th | grep -v shm | grep -v -i filesy |sort -k1 | while read LINE
do
  PART_NAME=`echo $LINE | awk ' {print $1 } '`
  TESTSTRING=${PART_NAME:0:7}
  MOUNT_POINT=`echo $LINE |awk ' {print $7 } '`
    if [ $TESTSTRING == "/dev/sd" ]; then
      echo "Shrinking $PART_NAME mounted At:'$MOUNT_POINT'"
      time vmware-toolbox-cmd disk shrink $MOUNT_POINT
    fi
done
