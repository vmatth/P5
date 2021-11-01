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

echo_and_run cd "/home/axel/P5/src/geometry2/tf2_py"

# ensure that Python install destination exists
<<<<<<< HEAD
echo_and_run mkdir -p "$DESTDIR/home/vini/P5/install/lib/python3/dist-packages"
=======
echo_and_run mkdir -p "$DESTDIR/home/axel/P5/install/lib/python2.7/dist-packages"
>>>>>>> c0686da4ef00f543f3e2534c55792ba20b859868

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
<<<<<<< HEAD
    PYTHONPATH="/home/vini/P5/install/lib/python3/dist-packages:/home/vini/P5/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/vini/P5/build" \
    "/usr/bin/python3" \
    "/home/vini/P5/src/geometry2/tf2_py/setup.py" \
=======
    PYTHONPATH="/home/axel/P5/install/lib/python2.7/dist-packages:/home/axel/P5/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/axel/P5/build" \
    "/usr/bin/python2" \
    "/home/axel/P5/src/geometry2/tf2_py/setup.py" \
>>>>>>> c0686da4ef00f543f3e2534c55792ba20b859868
     \
    build --build-base "/home/axel/P5/build/geometry2/tf2_py" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/axel/P5/install" --install-scripts="/home/axel/P5/install/bin"
