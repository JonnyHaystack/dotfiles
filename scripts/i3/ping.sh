#!/bin/bash

ping -c 1 google.com | head -2 | tail -1 | awk '{print $8}' | cut -d '=' -f 2
