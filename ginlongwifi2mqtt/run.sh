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

CLIENT_ID=$(bashio::config "client_id")
LISTEN_ADDRESS=$(bashio::config "listen_address")
LISTEN_PORT=$(bashio::config "listen_port")

OTHER_ARGS=""

if bashio::config.true "discovery"; then
  OTHER_ARGS="${OTHER_ARGS} --homeassistant"
fi

echo "Starting ginlong-wifi-mqtt.py..."
python3 -u /ginlong-wifi-mqtt.py --client_id $CLIENT_ID --listen_address $LISTEN_ADDRESS --listen_port $LISTEN_PORT --mqtt_address $MQTT_HOST --mqtt_port $MQTT_PORT  --mqtt_username $MQTT_USERNAME --mqtt_password $MQTT_PASSWORD $OTHER_ARGS
