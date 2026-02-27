#!/usr/bin/env bash
set -euo pipefail

# Remove known compiled CSS files that contain Bootstrap-era styles
# Run from repository root: bash scripts/cleanup_bootstrap_assets.sh

echo "Removing compiled Bootstrap-era CSS files from public/assets..."
rm -f public/assets/application-*.css public/assets/app-*.css || true

echo "Done. You may want to rebuild Tailwind assets (e.g. ./bin/dev or rails assets:precompile)." 
