#!/bin/bash

PORT=${PORT:-8000}

while true; do
    netcat -l -n -p $PORT -q -1 -v << ENDOFREPLY
HTTP-Version: HTTP/1.0 200 OK
Content-Length: $(stat -c %s content.html)
Content-Type: text/html

$(cat content.html)
ENDOFREPLY
done
