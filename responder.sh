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
if [ -z "$f" ];then (
    $e $o;
    $e;
    (for n in *;do
        if [ -f "$n" ]; then
            $e "<a href=\"/$n\">`ls -gh \"$n\"`</a><br>";
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
