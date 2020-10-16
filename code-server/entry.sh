#!/bin/bash
if [ -e /tmp/first_run ]; then
    echo "This is your FIRST time running this server."
    echo "You SHOULD set your authentication option."
    echo "you can find configuration file at:"
    echo "    /root/.config/code-server/config.yaml"
    rm /tmp/first_run
fi
code-server


