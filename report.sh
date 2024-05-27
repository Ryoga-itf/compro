#!/bin/bash

STUDENT_NAME="筑波太郎"
STUDENT_ID="202311XXX"
STUDENT_UTID="s2311XXX"

for file in $(find . -type f -name 'report*.raw.txt'); do
    sed -e "s/__STUDENT_NAME__/$STUDENT_NAME/g" -e "s/__STUDENT_ID__/$STUDENT_ID/g" -e "s/__STUDENT_UTID__/$STUDENT_UTID/g" $file \
      > $(echo $file | sed "s/.raw//")
done
