#!/bin/sh
if [ -n "$VIRTUAL_ENV" ]; then
    echo "First, run 'deactivate' to exit from virtual env."
    exit 1
fi
if [ -z "$(which sage)" ]; then
    echo "sage should be on the execution PATH."
    exit 1
fi
case "$(sage --python --version)" in
    "$(python --version)")
        ;;
    *)
        echo "python version should be the same as bundled with sage, $(sage --python --version)"
        exit 1
        ;;
esac
top=$(cd $(dirname $0)/..; pwd)

# create virtual env.
if ! [ -d .env ]; then
    echo "Creating venv..."
    python -m venv --prompt "${1:-sage_env}" .env
fi
if ! [ -d .env/bin ]; then
    echo "error: missing .env/bin"
    exit 1
fi
. .env/bin/activate

# link sage packages to virtual env.
if ! [ -d .env/lib/python*/site-packages/sage ]; then
    echo "Making sage packages referable..."
    site_pkg=''
    cd .env/lib/python*/site-packages
    python_lib_for_sage=$(sage --python -c 'import sys; from pathlib import Path; print(Path(sys.path[1]).parent)')
    sage_pkg_path=''
    for p in ${python_lib_for_sage}/python*/site-packages; do
        if [ -d "$p" ]; then
            sage_pkg_path="$p"
        fi
    done
    if [ -z "$sage_pkg_path" ]; then
        echo "Cannot find sage packages."
        exit 1
    fi
    ln -s ${sage_pkg_path}/sage* .
fi

# add packages
echo "(Re-)Installing required packages..."
cd ${top}
PATH=$PATH:${python_lib_for_sage}/../bin
export PATH
pip install -U pip setuptools
pip install -r $(dirname $0)/requirements-sage.txt

echo ''
echo "Run '. .env/bin/activate' to use sage."
