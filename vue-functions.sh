#!/bin/bash

vbase() {
  # 1. Check if an argument was provided
  if [ -z "$1" ]; then
    echo "Error: Please provide a path (e.g., create-vue-file src/components/Example.vue)"
    return 1
  fi

  local FILE_PATH="$1"
  local DIR_PATH=$(dirname "$FILE_PATH")

  # 2. Create the directory structure if it doesn't exist
  mkdir -p "$DIR_PATH"

  # 3. Generate the file with the boilerplate content
  cat <<EOF > "$FILE_PATH"
<script setup lang="ts"></script>

<template>
  <div></div>
</template>

<style scoped></style>
EOF

  echo "Successfully created: $FILE_PATH"
}