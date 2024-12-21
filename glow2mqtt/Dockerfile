ARG BUILD_FROM
FROM $BUILD_FROM

ARG VERSION=1.3.1

# Fetch application
RUN wget https://github.com/scooter1556/glow-mqtt/releases/download/$VERSION/glow2mqtt_$VERSION.zip -O app.zip
RUN unzip app.zip
RUN rm app.zip

RUN \
  apk add --no-cache \
    python3 \
    py3-paho-mqtt

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
