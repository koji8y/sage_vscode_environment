SageMath environment for VSCode
====
# Prerequisites
- Sage is installed and executable `sage` is on execution PATH.
    - See https://doc.sagemath.org/html/en/installation/binary.html
- You have to install the same version of python as bundled with Sage.
- No directory named `.env` exists here.

# Preparation
- Run `setup/setup.sh`
    - Confirmed environment(s):
        - Ubuntu 20.04 with SageMath version 9.4, Release Date: 2021-08-22 (used tar ball `sage-9.4-Ubuntu_20.04-x86_64.tar.gz`.)
        - macos 12.2.1 with SageMath version 9.5, Release Date: 2022-01-30 (installed with `brew install sage`.)

# Check
1. Open this folder with VSCode.
1. Open file `run.py`.
1. Push `Run below` to run all the cells.

# References
- https://doc.sagemath.org/html/en/faq/faq-usage.html#how-do-i-import-sage-into-a-python-script
