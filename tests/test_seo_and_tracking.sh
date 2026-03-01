#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

file="index.html"
failures=0

check_contains() {
  local pattern="$1"
  local label="$2"
  if rg -q --fixed-strings "$pattern" "$file"; then
    echo "OK   $label"
  else
    echo "MISS $label"
    failures=$((failures + 1))
  fi
}

check_contains 'name="description"' "meta description"
check_contains '<link rel="canonical" href="https://home.hiraeth.wiki/" />' "canonical url"
check_contains 'name="robots" content="index,follow"' "robots meta"

check_contains 'property="og:type" content="website"' "og:type"
check_contains 'property="og:site_name" content="Hiraeth Archives & Guides"' "og:site_name"
check_contains 'property="og:title" content="HAG - Hiraeth Archives & Guides"' "og:title"
check_contains 'property="og:description"' "og:description"
check_contains 'property="og:url" content="https://home.hiraeth.wiki/"' "og:url canonical"
check_contains 'content="https://home.hiraeth.wiki/assets/images/wiki-1920x1080.jpg"' "og/twitter image absolute url"
check_contains 'property="og:image:alt"' "og:image:alt"

check_contains 'name="twitter:card" content="summary_large_image"' "twitter:card"
check_contains 'name="twitter:title" content="HAG - Hiraeth Archives & Guides"' "twitter:title"
check_contains 'name="twitter:description"' "twitter:description"
check_contains 'name="twitter:image"' "twitter:image"

check_contains 'const TRACKING_CONSENT_KEY = "tracking_consent";' "tracking consent key"
check_contains 'const POSTHOG_API_KEY = "REPLACE_WITH_POSTHOG_API_KEY";' "posthog key placeholder"
check_contains 'const POSTHOG_API_HOST = "https://us.i.posthog.com";' "posthog host"
check_contains 'window.posthog.init(POSTHOG_API_KEY, {' "posthog init"
check_contains 'window.hiraethTracking = {' "tracking helper api"
check_contains 'if (regulated) {' "regulated-region gate"
check_contains 'if (consent === "granted") loadPostHogOnce();' "opt-in requirement for regulated regions"

if [[ "$failures" -ne 0 ]]; then
  echo "FAIL: $failures required SEO/tracking checks missing."
  exit 1
fi

echo "PASS: all SEO/tracking checks passed."
