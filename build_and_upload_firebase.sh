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
  ./build_and_upload_firebase.sh android-dev
  ./build_and_upload_firebase.sh android-prod-apk
  ./build_and_upload_firebase.sh android-prod-aab
  ./build_and_upload_firebase.sh ios-prod
  ./build_and_upload_firebase.sh ios-dev

The script builds the selected Flutter artifact, then uploads it to
Firebase App Distribution through Fastlane.

Common env vars:
  FIREBASE_GROUPS=qa
  FIREBASE_TESTERS="one@example.com,two@example.com"
  FIREBASE_RELEASE_NOTES="Release notes"
  FIREBASE_DEBUG=true
  GOOGLE_APPLICATION_CREDENTIALS=/absolute/path/firebase-service-account.json
  IOS_EXPORT_METHOD=ad-hoc
USAGE
}

if [ "$#" -ne 1 ]; then
  usage
  exit 64
fi

target="$1"
ios_export_method="${IOS_EXPORT_METHOD:-ad-hoc}"
build_stamp_file=""

if ! command -v fvm >/dev/null 2>&1; then
  echo "fvm not found. Install FVM or run the Flutter build manually before ./upload_firebase.sh." >&2
  exit 69
fi

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler not found. Install it with: gem install bundler" >&2
  exit 69
fi

if ! bundle check >/dev/null 2>&1; then
  echo "Fastlane dependencies are missing. Run: BUNDLE_PATH=vendor/bundle bundle install" >&2
  exit 69
fi

case "$target" in
  android-dev)
    fvm flutter build apk --flavor development -t ./lib/main_dev.dart
    ;;
  android-prod-apk)
    fvm flutter build apk --flavor production
    ;;
  android-prod-aab)
    fvm flutter build appbundle --flavor production
    ;;
  ios-prod)
    build_stamp_file="$(mktemp -t wom-pocket-ios-build.XXXXXX)"
    fvm flutter build ipa --flavor production --export-method "$ios_export_method"
    ipa_path="$(find build/ios/ipa -type f -name '*.ipa' -newer "$build_stamp_file" -print | head -n 1)"
    if [ -z "$ipa_path" ]; then
      echo "iOS build did not create a new IPA. Check the Xcode export/signing errors above." >&2
      exit 70
    fi
    export FIREBASE_IOS_PROD_IPA_PATH="$ipa_path"
    ;;
  ios-dev)
    build_stamp_file="$(mktemp -t wom-pocket-ios-build.XXXXXX)"
    fvm flutter build ipa --flavor development -t ./lib/main_dev.dart --export-method "$ios_export_method"
    ipa_path="$(find build/ios/ipa -type f -name '*.ipa' -newer "$build_stamp_file" -print | head -n 1)"
    if [ -z "$ipa_path" ]; then
      echo "iOS build did not create a new IPA. Check the Xcode export/signing errors above." >&2
      exit 70
    fi
    export FIREBASE_IOS_DEV_IPA_PATH="$ipa_path"
    ;;
  *)
    usage
    exit 64
    ;;
esac

./upload_firebase.sh "$target"
