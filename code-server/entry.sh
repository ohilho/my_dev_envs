#!/bin/bash
if [ -e /tmp/first_run ]; then
    echo "Make a new password. If you don't want to use authentication, leave it empty and press enter."
    echo "New password: "
    read password
    if [ -z ${password} ];then
        sed "s/auth: password/auth: none/" /root/.config/code-server/config.yaml > /root/.config/code-server/config.yaml.new
        rm /root/.config/code-server/config.yaml
        mv /root/.config/code-server/config.yaml.new /root/.config/code-server/config.yaml
        echo "No password input. Authentication disabled";
    else
        sed "s/password: 0000/password: ${password}/" /root/.config/code-server/config.yaml > /root/.config/code-server/config.yaml.new
        rm /root/.config/code-server/config.yaml
        mv /root/.config/code-server/config.yaml.new /root/.config/code-server/config.yaml
        echo "Password set to \"${password}\""
        rm /tmp/first_run
    fi
fi
code-server


