#!/usr/bin/bash
ROOT_UID=0
# if root install in root /bin folder
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr"
else
  DEST_DIR="$HOME/.local"
fi

# symlinking each file in the sounds directory

cp "$PWD/bruh" "$HOME/.local/bin/bruh"
echo "copied bruh into $HOME/.local/bin"
FILES="$PWD/sounds/"*
for f in $FILES do
  FILEPATH=$HOME/.local/bin/$(echo $f |awk -F/ '{print $NF}' |  awk -F. '{print $1}')
   if [  -e $FILEPATH ]; then 
        rm $FILEPATH # file exists, remove it to prevent failure for ln
   fi
  ln -s "$HOME/.local/bin/bruh" $FILEPATH
done

cp "$PWD/sounds/"*  "$HOME/.local/share"
echo "symlinked sound programs to $HOME/.local/bin"
echo "copied sounds to $HOME/.local/share"
