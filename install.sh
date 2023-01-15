#!/usr/bin/bash
ROOT_UID=0
# if root install in root /bin folder
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr"
else
  DEST_DIR="$HOME/.local"
fi

# symlinking each file in the sounds directory

cp "$PWD/soundboard" "$DEST_DIR/bin/soundboard"
echo "copied soundboard into $DEST_DIR/bin"
FILES="sounds/*"
for F in $FILES; do
  F_ABSOLUTE="$PWD/$F"
  FILENAME=$(basename "$F_ABSOLUTE" .wav)
  FILEPATH="$HOME/.local/bin/$FILENAME"
  if [ -f "$FILEPATH" ]; then 
        rm "$FILEPATH" # file exists, remove it to prevent failure for ln
  fi
  ln -s "$HOME/.local/bin/soundboard" "$FILEPATH"
  chmod +x "$FILEPATH"
done

if [ -d "$HOME/.local/share/soundboard" ]; then
	rm -rf "$HOME/.local/share/soundboard"
fi

mkdir  "$HOME/.local/share/soundboard"
cp "$PWD/sounds/"*  "$HOME/.local/share/soundboard"
echo "symlinked sound programs to $HOME/.local/bin"
echo "copied sounds to $HOME/.local/share/soundboard"
