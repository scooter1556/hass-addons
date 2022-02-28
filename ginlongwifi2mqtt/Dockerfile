ARG BUILD_FROM

FROM $BUILD_FROM

ARG SRCREV=4ad68b76bbfb1461f91dbe672cd83be4de2bd8de

# Fetch application
RUN wget https://raw.githubusercontent.com/scooter1556/ginlong-wifi-mqtt/$SRCREV/ginlong-wifi-mqtt.py -O ginlong-wifi-mqtt.py

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
