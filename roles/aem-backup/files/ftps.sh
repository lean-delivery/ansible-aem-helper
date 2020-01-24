#!/bin/bash
lftp -u $1,$2 ftps://$1@$3 << EOF
put $4
EOF
if [[ $? == 0 ]]; then
 echo "Successful"
fi
exit