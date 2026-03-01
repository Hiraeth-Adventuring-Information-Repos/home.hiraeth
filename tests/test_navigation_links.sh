#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

file="index.html"
url='href="https://gems.hiraeth.wiki"'
failures=0

check_pass() {
  local label="$1"
  echo "OK   $label"
}

check_fail() {
  local label="$1"
  echo "MISS $label"
  failures=$((failures + 1))
}

total_matches=$(rg -o --fixed-strings "$url" "$file" | wc -l | tr -d ' ')
if [[ "$total_matches" -ge 2 ]]; then
  check_pass "gems link appears at least twice"
else
  check_fail "gems link appears at least twice"
fi

key_sites_block=$(sed -n '/<section id="key-sites">/,/<\/section>/p' "$file")
if printf '%s\n' "$key_sites_block" | rg -q --fixed-strings "$url"; then
  check_pass "gems link appears in key-sites section"
else
  check_fail "gems link appears in key-sites section"
fi

useful_links_block=$(sed -n '/<section id="useful-links"/,/<\/section>/p' "$file")
if printf '%s\n' "$useful_links_block" | rg -q --fixed-strings "$url"; then
  check_pass "gems link appears in useful-links section"
else
  check_fail "gems link appears in useful-links section"
fi

if [[ "$failures" -ne 0 ]]; then
  echo "FAIL: $failures required navigation checks missing."
  exit 1
fi

echo "PASS: all navigation link checks passed."
