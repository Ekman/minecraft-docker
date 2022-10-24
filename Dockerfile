FROM ibm-semeru-runtimes:open-18-jre

ARG DOWNLOAD_SERVER_URL="https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar"

ENV USER=minecraft PORT=25565 MEMORY="1G"
ENV CONFIG_DIR="/home/$USER/config" BIN_PATH="/home/$USER/server.jar"

EXPOSE "$PORT"

RUN adduser --system --group --disabled-login --disabled-password "$USER" \
    && apt-get update \
    && apt-get install --yes --no-install-recommends gosu tini \
    && apt-get clean --yes \
    && mkdir -p "$CONFIG_DIR" \
    && chown "$USER:$USER" "$CONFIG_DIR"

VOLUME [ "/tmp", "$CONFIG_DIR" ]

ADD --chown=minecraft:minecraft "$DOWNLOAD_SERVER_URL" "$BIN_PATH"
ADD ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "tini", "-v", "--", "sh", "/docker-entrypoint.sh" ]
