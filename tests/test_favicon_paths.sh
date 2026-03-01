#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

failures=0

while IFS= read -r path; do
  if [[ -f "$path" ]]; then
    echo "OK $path"
  else
    echo "MISSING $path"
    failures=$((failures + 1))
  fi
done < <(rg -o 'href="[^"]+"' index.html \
  | sed -E 's/^.*href="([^"]+)".*/\1/' \
  | rg '^assets/favicon/')

if [[ "$failures" -ne 0 ]]; then
  echo "FAIL: $failures favicon path(s) do not exist."
  exit 1
fi

echo "PASS: all favicon paths exist."
