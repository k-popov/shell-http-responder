#!/bin/bash

PORT=${PORT:-8000}

# code from https://gist.github.com/alexey-sveshnikov/69d502aefd05a539c165
while [ "$?" -eq "0" ]; do
    socat -d -d -d -v TCP4-LISTEN:${PORT},reuseaddr,crlf,fork EXEC:'bash responder.sh',pipes
done
