#!/usr/bin/env bash
# Verifies every docs/*.png referenced in README.md actually exists.
cd "$(dirname "$0")/.."
missing=0
for img in $(grep -oE 'docs/[A-Za-z0-9._-]+\.png' README.md | sort -u); do
  if [ ! -f "$img" ]; then echo "MISSING: $img"; missing=1; fi
done
if [ "$missing" -eq 0 ]; then echo "All screenshots present."; else echo "Add the missing files (see docs/SCREENSHOTS.md) before pushing."; exit 1; fi
