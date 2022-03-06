#!/bin/bash

# service ssh start
FILES="/root/pub/*"
mkdir -p /root/.ssh
for f in $FILES; do
    echo "Processing $f file..."
    cat "$f" >/root/.ssh/authorized_keys
done
echo "================ Done ================"
