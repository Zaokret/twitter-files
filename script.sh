#!/bin/bash

# Define variables
FILE_TO_MODIFY="ad-engagements.js"
EXTRACT_SCRIPT="ad-targeting-criteria.js"
ROOT_FOLDER="."
DATA_FILE="ad-data.json"

# Search for the file in the entire folder and it's subfolders
TARGET_FILE=$(find "$ROOT_FOLDER" -type f -name "$FILE_TO_MODIFY")

# Check if the file was found
if [ -n "$TARGET_FILE" ]; then
  echo "Found $TARGET_FILE. Copying file to the root folder..."

  # Copy the original file to the root folder
  cp "$TARGET_FILE" "$ROOT_FOLDER/"

  # Define the copied file's path
  COPIED_FILE="$ROOT_FOLDER/$FILE_TO_MODIFY"

  echo "Copy complete. Modifying the copied file..."

  # Replace the string `window.YTD.ad_engagements.part0` with `module.exports` in the copied file only
  sed -i 's/window\.YTD\.ad_engagements\.part0/module.exports/g' "$COPIED_FILE"

  echo "Modification complete on the copied file."

  # Run extract.js script with node
  if [ -f "$EXTRACT_SCRIPT" ]; then
    echo "Running $EXTRACT_SCRIPT with node..."
    node "$EXTRACT_SCRIPT"
  else
    echo "Error: $EXTRACT_SCRIPT not found in the root folder."
  fi

   # Open `data.json` in the default text editor
  if [ -f "$DATA_FILE" ]; then
    echo "Opening $DATA_FILE with the default text editor..."
    
    # Check the operating system and open the file accordingly
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      xdg-open "$DATA_FILE"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      open "$DATA_FILE"
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      start "$DATA_FILE"
    else
      echo "Unsupported OS: cannot automatically open $DATA_FILE."
    fi
  else
    echo "Error: $DATA_FILE not found in the root folder."
  fi

else
  echo "Error: $FILE_TO_MODIFY not found in the project."
fi