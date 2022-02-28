# Home Assistant Add-on: Ginlong Solis Wi-Fi To MQTT

Collect data from a second generation Ginlong Solis inverter equipped with a Wi-Fi stick and publish to an MQTT broker.

## Introduction
A Ginlong Solis second generation inverter equipped with a Wi-Fi stick sends it's data to the Ginlong
Monitoring website (http://www.ginlongmonitoring.com/) once every six minutes, when the inverter is 
live. It is also possible to log onto the Wi-Fi stick locally with a browser to configure the inverter
and read the six minute updated generation stats. The Wi-Fi stick also has the ability to send statistics 
to 2 further remote servers over TCP or UDP.

## Configuring The Wi-Fi Stick

**Note:** We assume that the Wi-Fi stick is already connected to your Wi-Fi network. If not you will need to connect to the AP of the Wi-Fi stick and go through the browser-based setup to get it connected.

Determine the IP address of your Wi-Fi stick
Log onto your Wi-Fi stick by entering the IP address into a web browser and click on 'Advanced'
Now click 'Remote server'
Enter the IP address of your Home Assistant installation for 'Server B' and enter a port number (default 9999) and select 'TCP' 
Click the 'Test' button and a tick should appear.
Click 'Save' and and when prompted 'Restart'

## Addon Configuration

By default this addon assumes the official Mosquitto addon is installed in which case MQTT connection information is determined automatically. Otherwise, to use an external broker, provide the following configuration options:

* `mqtt_host`
* `mqtt_port`
* `mqtt_user`
* `mqtt_password`

By default this addon will listen on all addresses for incoming data and port 9999. If you would like to limit this to the Wi-Fi stick IP only or you chose a different port then provide the following information:

* `listen_address`: The IP address of your Wi-Fi stick where we should listen for incoming data
* `listen_port`: The port incoming data will be sent on

You can also provide a client ID to assign a suitable name for your inverter or to differentiate between multiple inverters and clients:
* `client_id`: Default is 'home'

Miscellaneous options:
* `discovery`: Home Assistant automatic MQTT discovery
