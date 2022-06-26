#!/usr/bin/env bashio

if bashio::services.available mqtt; then
  echo "MQTT found in this Home Assistant instance."
  MQTT_HOST=$(bashio::services mqtt "host")
  MQTT_PORT=$(bashio::services mqtt "port")
  export MQTT_USERNAME=$(bashio::services mqtt "username")
  export MQTT_PASSWORD=$(bashio::services mqtt "password")
else
  echo "Using external MQTT broker."
  MQTT_HOST=$(bashio::config "mqtt_host")
  MQTT_PORT=$(bashio::config "mqtt_port")
  export MQTT_USERNAME=$(bashio::config "mqtt_user")
  export MQTT_PASSWORD=$(bashio::config "mqtt_password")
fi

GLOW_DEVICE=$(bashio::config "glow_device_id")
GLOW_USERNAME=$(bashio::config "glow_username")
GLOW_PASSWORD=$(bashio::config "glow_password")
GLOW_PROVIDER=$(bashio::config "glow_provider")

OTHER_ARGS=""

if bashio::config.true "discovery"; then
  OTHER_ARGS="${OTHER_ARGS} --homeassistant"
fi

echo "Starting glow2mqtt.py..."
python3 -u /glow2mqtt.py --glow_device $GLOW_DEVICE --glow_username $GLOW_USERNAME --glow_password $GLOW_PASSWORD --glow_provider $GLOW_PROVIDER --mqtt_address $MQTT_HOST --mqtt_port $MQTT_PORT  --mqtt_username $MQTT_USERNAME --mqtt_password $MQTT_PASSWORD $OTHER_ARGS
