#!/bin/bash

POWERED=$(busctl get-property org.bluez /org/bluez/hci0 org.bluez.Adapter1 Powered 2>/dev/null)
CONNECTED=0
DEVICES=""

while IFS= read -r line; do
  line=$(echo "$line" | xargs)
  if [[ "$line" == /org/bluez/hci0/dev_* ]]; then
    STATUS=$(busctl get-property org.bluez "$line" org.bluez.Device1 Connected 2>/dev/null)
    NAME=$(busctl get-property org.bluez "$line" org.bluez.Device1 Name 2>/dev/null | grep -oP '"\K[^"]+')
    if [[ "$STATUS" == "b true" ]]; then
      ((CONNECTED++))
      DEVICES+="$NAME\n"
    fi
  fi
done < <(busctl tree org.bluez 2>/dev/null)

if [[ "$POWERED" == "b true" && "$CONNECTED" -gt 0 ]]; then
  printf '{"text": "<span size='\''6pt'\''>BT </span>%02d", "tooltip": "%s"}' "$CONNECTED" "$(echo -e "$DEVICES" | xargs)"
elif [[ "$POWERED" == "b true" ]]; then
  echo '{"text": "<span size='\''6pt'\''>BT </span>ON", "tooltip": "No devices connected"}'
else
  echo '{"text": "<span size='\''6pt'\''>BT </span>OFF", "tooltip": "Bluetooth disabled"}'
fi
