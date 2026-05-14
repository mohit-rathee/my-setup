#!/bin/bash
echo "$(date) Brightness up" >> /tmp/acpi-brightness.log
STEP=3
/usr/bin/brightnessctl set ${STEP}%+ >> /tmp/acpi-brightness.log 2>&1

