#!/bin/bash

while IFS= read -r line; do
    if [[ $line == *"Print raw tx in case of broadcast failure"* ]]; then
        raw_tx=${line##*Print raw tx in case of broadcast failure }

        curl 'https://mempool.space/api/tx' \
            -H 'authority: mempool.space' \
            -H 'accept: application/json, text/plain, */*' \
            -H 'content-type: text/plain' \
            --data-raw "$raw_tx" \
            --compressed
        echo "\n"
    fi
done <"nohup.txt"
