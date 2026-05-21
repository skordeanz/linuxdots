#!/bin/bash

if pgrep -x hypridle >/dev/null; then
  echo '{"text": "󱫖", "tooltip": "Idle: enabled - click to disable", "class": ""}'
else
  echo '{"text": "󱫖", "tooltip": "Idle: disabled - click to enable", "class": "active"}'
fi
