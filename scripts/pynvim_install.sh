#!/usr/bin/env bash

virtualenv --system-site-packages -p /usr/bin/python2 ~/.virtualenvs/pynvim2
virtualenv --system-site-packages -p /usr/bin/python3 ~/.virtualenvs/pynvim3
source ~/.virtualenvs/pynvim2/bin/activate
pip install pynvim
source ~/.virtualenvs/pynvim3/bin/activate
pip install pynvim
