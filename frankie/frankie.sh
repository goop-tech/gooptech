#!/bin/bash

unbuffer hyfetch | aha -n > hyfetch.html
uptime | aha -n > uptime.html
uname -a | aha -n > uname.html
vmstat | aha -n > uname.html