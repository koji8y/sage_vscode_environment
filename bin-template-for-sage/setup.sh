#!/bin/sh
if [ -n "$VIRTUAL_ENV" ]; then
    echo "First, run 'deactivate' to exit from virtual env."
    exit 1
fi
top=$(dirname $0)
cd $(dirname $0)/..
if ! [ -d .env ]; then
    echo "Creating venv..."
    sage -python -m venv --prompt "${1:-sage_env}" .env
fi
if ! [ -d .env/bin ]; then
    echo "error: missing .env/bin"
    exit 1
fi
cmp -l $top/python3 .env/bin/python > /dev/null 2>&1
if [ 0$? -ne 0 ]; then
    echo "Replacing python3 interpreter..."
    execfile=.env/bin/python3
    mv $execfile $execfile-proper
    cp $top/python3 .env/bin
    chmod +x $execfile

    echo "Replacing pip3 command..."
    pips=$(cd .env/bin; ls -1 pip*)
    mkdir .env/bin/proper
    mv .env/bin/pip* .env/bin/proper
    for p in $pips; do
        cp $top/pip3 .env/bin/$p
    done
    chmod +x .env/bin/pip*
else
    echo "Already set up it."
fi
echo "Run '. .env/bin/activate' to use sage."
