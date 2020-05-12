#!/bin/bash

notify-send "Shutdown" "Aborting shutdown..."
kill $(pgrep "shutdown_with")
