#!/bin/bash

HEADERS_BASE_PATH=${HOME}/.headers

if [ -d "$HEADERS_BASE_PATH" ]; then
  cd "$HEADERS_BASE_PATH"
  git remote -v | grep -q origin.*github\.com/mikepurvis/headers
  if [ "$?" == "0" ]; then
    echo "Repo already present in $HEADERS_BASE_PATH, skipping clone."
  else
    echo "Path $HEADERS_BASE_PATH, but is not a clone of this repo."
    echo "Back up and remove previous $HEADERS_BASE_PATH folder and run setup script again."
    exit 1
  fi
else
  echo "Cloning repo to $HEADERS_BASE_PATH"
  git clone https://github.com/mikepurvis/headers $HEADERS_BASE_PATH
fi

echo "Creating ~/bin/use_headers"
cat << EOF > ${HOME}/bin/use_headers
HEADERS_BASE_PATH="$HEADERS_BASE_PATH" $HEADERS_BASE_PATH/use_headers \$*
EOF
chmod +x ${HOME}/bin/use_headers

echo "You may need to log out and in again for ~/bin to be added to your path."
