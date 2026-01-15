#!/usr/bin/env bash
set -euo pipefail

DEFAULT_ARGS=("--platform" "gcp" "--region" "us-central1" "--config" "kamal.yml")
KAMAL_ARGS=("${@:-${DEFAULT_ARGS[@]}}")

kamal deploy "${KAMAL_ARGS[@]}"
kamal run -- "${KAMAL_ARGS[@]}" bundle exec rails db:migrate
kamal run -- "${KAMAL_ARGS[@]}" bundle exec rails db:seed
