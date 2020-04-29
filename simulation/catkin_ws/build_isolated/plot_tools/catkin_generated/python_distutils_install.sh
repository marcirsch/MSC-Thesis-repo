#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/plot_tools"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/lib/python2.7/dist-packages:/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/plot_tools/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/plot_tools" \
    "/usr/bin/python2" \
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/plot_tools/setup.py" \
    build --build-base "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/plot_tools" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" --install-scripts="/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/bin"