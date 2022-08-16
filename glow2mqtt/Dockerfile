ARG BUILD_FROM
FROM $BUILD_FROM

ARG SRCREV=7719760fcf5a058e860a1a012f02f6a51562f5e3

# Fetch application
RUN wget https://raw.githubusercontent.com/scooter1556/glow-mqtt/$SRCREV/glow2mqtt.py -O glow2mqtt.py

RUN \
  apk add --no-cache \
    python3 \
    py3-pip

RUN \
  python3 -m pip install --no-cache-dir \
    paho.mqtt

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
