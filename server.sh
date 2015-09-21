#!/bin/bash

PORT=${PORT:-8000}

# code from https://gist.github.com/alexey-sveshnikov/69d502aefd05a539c165
while true do
    socat -v tcp-l:${PORT},reuseaddr,crlf EXEC:'bash responder.sh'
done
