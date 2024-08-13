#!/bin/sh
set -e 

nginx -g 'daemon on;'

ffmpeg -i rtmp://191.252.193.123/live/teste \
    -c:v libx264 -c:a aac -strict -2 -crf 18 -preset veryfast \
    -f hls -hls_time 10 -hls_list_size 0 -hls_segment_filename '/usr/share/nginx/html/output%03d.ts' \
    /usr/share/nginx/html/output.m3u8


tail -f /dev/null