#!/bin/bash

PORT=${PORT:-8000}

# code from https://gist.github.com/alexey-sveshnikov/69d502aefd05a539c165
while [ "0" -eq "0" ]; do
    socat -d -d -d -v tcp-l:${PORT},reuseaddr,crlf SYSTEM:'bash responder.sh',nofork
    echo "Socat exit code is $?"
done
