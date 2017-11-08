#!/bin/sh

# Set 5 second screen standby before locking (cat protection)
xset dpms 5 5 5

# Lock
i3lock -c 000000 --nofork

# Restore 10 minute screen standby after unlock
xset dpms 600 600 600
