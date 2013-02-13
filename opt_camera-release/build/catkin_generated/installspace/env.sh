#!/usr/bin/env sh
# generated from catkin/cmake/templates/env.sh.in

if [ $# -eq 0 ] ; then
  /bin/echo "Entering environment at '/home/ysuzuki/moirai-ws/install', type 'exit' to leave"
  . "/home/ysuzuki/moirai-ws/install/setup.sh"
  "$SHELL" -i
  /bin/echo "Exiting environment at '/home/ysuzuki/moirai-ws/install'"
else
  . "/home/ysuzuki/moirai-ws/install/setup.sh"
  exec "$@"
fi
