#!/bin/bash

# code from https://gist.github.com/alexey-sveshnikov/69d502aefd05a539c165
r=read;
e=echo;
$r a b c;
z=$r;
while [ ${#z} -gt 2 ]; do
    $r z;
done;
f=`$e $b|sed 's/[^a-z0-9_.-]//gi'`;
h="HTTP/1.0";
o="$h 200 OK\r\n";
c="Content";
echo "Checking for file '$f'" 1>&2
if [ -z "$f" ];then (
    $e $o;
    (for n in *;do
        echo "Processing file '$n' in for loop" 1>&2
        if [ -f "$n" ]; then
            echo "Processing file '$n' in if block" 1>&2
            $e "<a href=\"/$n\">`ls -gh \"$n\"`</a><br>";
            echo "Echoed '$n'" 1>&2
        fi;
    done);
);
elif [ -f "$f" ];then
    $e "$o$c-Type: `file -ib \"$f\"`\n$c-Length: `stat -c%s \"$f\"`";
    $e;
    $e $f>&2;
    cat "$f";
else
    $e -e "$h 404 Not Found\n\n404\n";
fi
