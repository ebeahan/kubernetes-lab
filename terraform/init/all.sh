#!/bin/bash -e

ARGS=$@

REVERSE_PARAM="--reverse"
REVERSE_PARAM_LEN=9 # This MUST, MUST, MUST be the length of the REVERSE_PARAM

if [ "$1" == "$REVERSE_PARAM" ]; then
    BUFFER=""
    for script in [0-9]*; do
        BUFFER="$script $BUFFER"
    done
    SHIFTED_ARGS=${ARGS[@]:$REVERSE_PARAM_LEN}
    for script in $BUFFER; do
        ./$script $SHIFTED_ARGS
    done
else
    for script in [0-9]*; do
        ./$script $ARGS
    done
fi