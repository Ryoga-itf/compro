#!/bin/bash


if [ -e .env ]; then
    eval "$(cat .env <(echo) <(declare -x))"
    [ -z "$STUDENT_NAME" ] && echo "WARN: STUDENT_NAME is empty"
    [ -z "$STUDENT_ID" ] && echo "WARN: STUDENT_NAME is empty"
    [ -z "$STUDENT_UTID" ] && echo "WARN: STUDENT_UTID is empty"
else
    STUDENT_NAME="筑波太郎"
    STUDENT_ID="202311XXX"
    STUDENT_UTID="s2311XXX"
fi


for file in $(find . -type f -name 'report*.raw.txt'); do
    sed -e "s/__STUDENT_NAME__/$STUDENT_NAME/g" -e "s/__STUDENT_ID__/$STUDENT_ID/g" -e "s/__STUDENT_UTID__/$STUDENT_UTID/g" $file \
      > $(echo $file | sed "s/.raw//")
done
