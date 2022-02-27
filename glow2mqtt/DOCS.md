# Home Assistant Add-on: Hildebrand Glow To MQTT

## Usage

You will need to have an active Glow account (usable through the Bright app), a Consumer Access Device (CAD), and MQTT access enabled for your account before using this addon. If you haven't been given Glowmarkt MQTT connection details by Hildebrand, you'll need to contact them and request MQTT access be enabled for your account.

## Configuration

By default this addon assumes the official Mosquitto addon is installed in which case MQTT connection information is determined automatically. Otherwise, to use an external broker, provide the following configuration options:

* `mqtt_host`
* `mqtt_port`
* `mqtt_user`
* `mqtt_password`

For the addon to function you need to provide the following information relating to your Glow account:

* `glow_device_id`: This is your CAD hardware ID (e.g. A8980AB7AB04)
* `glow_username`: The username associated with your Glow account (also used to login to the Bright app)
* `glow_password`: The password associated with your Glow account (also used to login to the Bright app)

* `discovery`: Home Assistant automatic MQTT discovery
