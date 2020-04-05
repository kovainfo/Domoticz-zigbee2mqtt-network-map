# Domoticz zigbee2mqtt network map
<img src="screenshot.png"></img>

## Prerequisites
This project is made directly for RaspberryPi, but can be easily adapted for other systems.
- dzVents must be 3.0 and above
- Setup and run zigbee2mqtt server (https://www.zigbee2mqtt.io)
- Setup and run zigbee2mqtt plugin (https://github.com/stas-demydiuk/domoticz-zigbee2mqtt-plugin)
- Install Mosquitto clients:
```
$ apt-get install mosquitto-clients
```

## Installation
1. Copy content of folder templates in your templates folder in Domoticz 
2. Set set the execution attribute for the file zigbeemap.sh
```
$ chmod +x /home/pi/domoticz/www/templates/zigbeemap/zigbeemap.sh
```
3. Open Domoticz script editor and create dzVents script named "dz_ZigBeeMapGenerator":

```
return {
	on = {
		customEvents = {
			'CreateZigbeeMap' -- event triggered by emitEvent
		}
	},
	data = {},
	logger = {},
	execute = function(domoticz, triggeredItem)
	    
	    function SendCommand()
            cmd = "/home/pi/domoticz/www/templates/zigbeemap/zigbeemap.sh"
            domoticz.utils.osExecute(cmd)
        end  
	    
		if (triggeredItem.isCustomEvent) then
			domoticz.utils._.print(triggeredItem.data)
			SendCommand()
		end
	end
}

```
