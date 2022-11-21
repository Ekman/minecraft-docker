#!/bin/sh

cd "$CONFIG_DIR"

gosu "$USER" \
    java \
    -server \
    "-Xmx$MEMORY" "-Xms$MEMORY" \
    -Duser.dir="$CONFIG_DIR" \
    -jar "$BIN_PATH" \
    nogui --port "$PORT" \
    "$@"
