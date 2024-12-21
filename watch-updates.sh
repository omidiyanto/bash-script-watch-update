#!/bin/bash

# Specify the folder to monitor
MONITORED_FOLDER="$1"

# Ensure inotify-tools is installed
if ! command -v inotifywait &> /dev/null; then
    echo "inotifywait command not found. Please install inotify-tools."
    exit 1
fi

# Monitor the folder for specific events
echo "Monitoring changes in: $MONITORED_FOLDER"
inotifywait -m -r -e create -e delete -e modify -e move "$MONITORED_FOLDER" --format '%T %w %f %e' --timefmt '%Y-%m-%d %H:%M:%S' |
while read -r event; do
    ## MAU NGELAKUIN APA UBAH DISINI
    echo "[$(date)] Change detected: $event" 
done

