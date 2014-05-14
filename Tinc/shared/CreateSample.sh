#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="Tinc"
QPKG_PATH=$(/sbin/getcfg $QPKG_NAME Install_Path -f $CONF)
TINCD="$QPKG_PATH/tincd"
LOG_TOOL=/sbin/log_tool

# TODO: Check /share/Tinc/sample doesn't exist

# TODO: cp -a $QPKG_PATH/sample to /share/Tinc/sample

# TODO: Generate an IP Address likely to be unique.
# eg: 172.16.#.#/32 where #.# is based on Mac address
# ip link show eth0 | grep link/ether | awk '{print $2}'
# python -c 'print(int("FF", 16))'

# TODO: sed s/HostName/$HOSTNAME/g in tinc.conf.sample, subnet-{up,down}, and hosts/HostName

# TODO: sed s/IPv4Address/172.16.#.#/g tinc-up and hosts/HostName

# TODO: rename hosts/HostName to $HOSTNAME

# TODO: generate keys: tind --generate-keys
# make sure it doesn't block on input
