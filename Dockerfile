FROM ghcr.io/zephyrproject-rtos/ci:v0.26.0

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
