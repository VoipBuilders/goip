#!/bin/bash

while true ; do
    CHECK_PROC=$(ps aux | grep radmsrvd | grep -v grep | wc -l)

    if [ $CHECK_PROC -lt 2 ]; then
        kill $(pidof radmsrvd) /dev/null 2>&1
        echo "radmin exit, try start."

        # Check if RADM_KEY is set
        if [ -n "${RADM_KEY}" ]; then
            cmd="/usr/local/bin/radmsrvd -nl -w ${RADM_RADM_WEBPORT} -u ${RADM_USERNAME} -P ${RADM_PASSWORD} -p ${RADM_CLIPORT} -k ${RADM_KEY} -r ${RADM_PORTRANGE}"
        else
            cmd="/usr/local/bin/radmsrvd -nl -w ${RADM_RADM_WEBPORT} -u ${RADM_USERNAME} -P ${RADM_PASSWORD} -p ${RADM_CLIPORT} -r ${RADM_PORTRANGE}"
        fi

        echo "${cmd}"
        ${cmd}
        sleep 5
    else
        date
        echo "radmin is running"
    fi

    sleep 30
done

