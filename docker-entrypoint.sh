#!/bin/sh

gosu "$USER" \
    java \
    "-Xmx$MEMORY" "-Xms$MEMORY" \
    -Duser.dir="$CONFIG_DIR" \
    -jar "$BIN_PATH" \
    nogui --port "$PORT" \
    "$@"
