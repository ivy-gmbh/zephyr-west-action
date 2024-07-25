FROM ghcr.io/zephyrproject-rtos/ci:v0.26.0

ENV ZEPHYR_SDK_INSTALL_DIR=/opt/toolchains/zephyr-sdk-0.16.0
ENV ZEPHYR_TOOLCHAIN_VARIANT=zephyr

# install rustup
RUN wget -O - https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup default stable

# install rust target for nrf5340
RUN rustup target add thumbv8m.main-none-eabihf

# install python ecdsa, required by nrf build
RUN pip install ecdsa

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
