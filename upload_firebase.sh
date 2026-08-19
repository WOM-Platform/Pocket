#!/bin/sh
set -eu

cd "$(dirname "$0")"

load_env_defaults() {
  env_file="$1"
  [ -f "$env_file" ] || return

  while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in
      '' | '#'*)
        continue
        ;;
    esac

    key="${line%%=*}"
    value="${line#*=}"
    case "$key" in
      '' | *[!A-Za-z0-9_]*)
        continue
        ;;
    esac

    eval "is_set=\${$key+x}"
    if [ -z "$is_set" ]; then
      export "$key=$value"
    fi
  done < "$env_file"
}

load_env_defaults fastlane/.env

export BUNDLE_PATH="${BUNDLE_PATH:-vendor/bundle}"

usage() {
  cat <<'USAGE'
Usage:
  ./upload_firebase.sh android-dev
  ./upload_firebase.sh android-prod-apk
  ./upload_firebase.sh android-prod-aab
  ./upload_firebase.sh ios-prod
  ./upload_firebase.sh ios-dev

This script only uploads existing Flutter artifacts. Build them first, or use:
  ./build_and_upload_firebase.sh <target>

Common env vars:
  FIREBASE_GROUPS=qa
  FIREBASE_TESTERS="one@example.com,two@example.com"
  FIREBASE_RELEASE_NOTES="Release notes"
  FIREBASE_DEBUG=true
  GOOGLE_APPLICATION_CREDENTIALS=/absolute/path/firebase-service-account.json
USAGE
}

if [ "$#" -lt 1 ]; then
  usage
  exit 64
fi

target="$1"
shift

case "$target" in
  android-dev)
    lane="firebase_android_dev"
    ;;
  android-prod-apk)
    lane="firebase_android_prod_apk"
    ;;
  android-prod-aab)
    lane="firebase_android_prod_aab"
    ;;
  ios-prod)
    lane="firebase_ios_prod"
    ;;
  ios-dev)
    lane="firebase_ios_dev"
    ;;
  *)
    usage
    exit 64
    ;;
esac

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler not found. Install it with: gem install bundler" >&2
  exit 69
fi

if ! bundle check >/dev/null 2>&1; then
  echo "Fastlane dependencies are missing. Run: BUNDLE_PATH=vendor/bundle bundle install" >&2
  exit 69
fi

bundle exec fastlane "$lane" "$@"
