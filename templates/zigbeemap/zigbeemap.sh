#!/bin/bash
mosquitto_sub -t zigbee2mqtt/bridge/networkmap/raw -C 1 > /home/pi/domoticz/www/templates/zigbeemap/raw.json &
mosquitto_pub -t zigbee2mqtt/bridge/networkmap -m raw

# wait until mosquitto_sub ends
wait


