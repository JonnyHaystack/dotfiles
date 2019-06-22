#!/usr/bin/env bash

virtualenv -p /usr/bin/python2 ~/.virtualenvs/pynvim2
virtualenv -p /usr/bin/python3 ~/.virtualenvs/pynvim3
workon pynvim2
pip install pynvim
workon pynvim3
pip install pynvim
deactivate
