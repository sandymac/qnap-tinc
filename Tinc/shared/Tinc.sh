#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="Tinc"
QPKG_PATH=$(/sbin/getcfg $QPKG_NAME Install_Path -f $CONF)
TINCD="$QPKG_PATH/tincd"
LOG_TOOL=/sbin/log_tool

case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
        echo "$QPKG_NAME is disabled."
        exit 1
    fi
    : ADD START ACTIONS HERE
    # Check for /share/Tinc
    if [ ! -d /share/Tinc/ ]; then
	# /share/Tinc/ is missing or not a directory, error
	$LOG_TOOL -t2 -uTinc -a 'Missing "Tinc" Shared Folder. Tinc start up failed.'
	$LOG_TOOL -t1 -uTinc -a 'Please create shared folder named "Tinc" with access restricted to admins and restart Tinc.'
	return -1
    fi
    # Check for /share/Tinc/sample config
    if [ -d /share/Tinc/sample ]; then
	$LOG_TOOL -t0 -uTinc -a 'Please implement Tinc sample creation.'
    fi
    # Start Tinc for echo of /share/Tinc/*/tinc.conf
    for netConfig in /share/Tinc/*/tinc.conf ; do
	configDir=`dirname $netConfig`
	netName=`basename $configDir`
	# Start tincd -n $netName -c $configDir --pidfile="$configDir/tinc.pid" --logfile="$configDir/tinc.log"
	$TINCD -n $netName -c $configDir --pidfile="$configDir/tinc.pid" --logfile="$configDir/tinc.log"
    done
    ;;

  stop)
    : ADD STOP ACTIONS HERE
    # Stop each Tinc Daemon
    for netConfig in /share/Tinc/*/tinc.conf ; do
	configDir=`dirname $netConfig`
	netName=`basename $configDir`
	# Stop tincd -n $netName -c $configDir --pidfile="$configDir/tinc.pid" --kill
	$TINCD -n $netName -c $configDir --pidfile="$configDir/tinc.pid" --kill
    done
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
