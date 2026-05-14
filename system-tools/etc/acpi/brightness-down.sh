#!/bin/bash

LOGFILE="/tmp/acpi-brightness.log"
MIN_BRIGHTNESS=0  # minimum brightness percentage
STEP=3            # note: no spaces around '='

echo "$(date) Brightness down pressed" >> "$LOGFILE"

# Get current brightness as a percentage
CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$(( CURRENT * 100 / MAX ))

echo "Current: $PERCENT%" >> "$LOGFILE"

if [ "$PERCENT" -le "$MIN_BRIGHTNESS" ]; then
  echo "Already at or below minimum ($MIN_BRIGHTNESS%), not reducing." >> "$LOGFILE"
else
  echo "Reducing brightness by ${STEP}%..." >> "$LOGFILE"
  brightnessctl set "${STEP}%-" >> "$LOGFILE" 2>&1
fi

