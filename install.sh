#!/usr/bin/bash
ROOT_UID=0

if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr"
else
  DEST_DIR="$HOME/.local"
fi

cp  "$PWD/programs/"*  "$DEST_DIR/bin"
cp "$PWD/sounds/"*  "$HOME/.local/share"
echo "copied programs to $DEST_DIR/bin"
echo "copied sounds to $HOME/.local/share"
