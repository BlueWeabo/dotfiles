#!/usr/bin/bash

echo "authd.service ## Starting ##" | systemd-cat -p info

plasma-polkit-agent
