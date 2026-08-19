# Firebase App Distribution

Fastlane is used for upload only. Flutter remains responsible for creating the
APK, AAB, or IPA.

## Setup

Install the Ruby dependencies locally in the project:

```sh
BUNDLE_PATH=vendor/bundle bundle install
```

Authenticate with Firebase using the Firebase CLI:

```sh
firebase login
```

or with a service account:

```sh
export GOOGLE_APPLICATION_CREDENTIALS=/absolute/path/firebase-service-account.json
```

The service account needs the Firebase App Distribution Admin role.

Local environment defaults are read from `fastlane/.env`. The committed template
is `fastlane/.env.example`.

Before the first upload for each Firebase app, open Firebase Console,
go to App Distribution for that app, and press `Get started`. Fastlane cannot
upload until App Distribution is initialized for the target app id.

## Build and Upload

Development Android APK:

```sh
FIREBASE_GROUPS=qa ./build_and_upload_firebase.sh android-dev
```

Production Android APK:

```sh
FIREBASE_GROUPS=qa ./build_and_upload_firebase.sh android-prod-apk
```

Production Android AAB:

```sh
FIREBASE_GROUPS=qa ./build_and_upload_firebase.sh android-prod-aab
```

Production iOS IPA:

```sh
FIREBASE_GROUPS=qa ./build_and_upload_firebase.sh ios-prod
```

Development iOS IPA:

```sh
FIREBASE_GROUPS=qa ./build_and_upload_firebase.sh ios-dev
```

For iOS, the default export method is `ad-hoc`. Override it with:

```sh
IOS_EXPORT_METHOD=development ./build_and_upload_firebase.sh ios-dev
```

The iOS upload script requires a newly exported IPA. If Xcode creates the
archive but fails the IPA export because signing profiles or certificates are
missing, the script stops before upload to avoid distributing an old IPA.

## Upload Only

If the artifact has already been built, use:

```sh
./upload_firebase.sh android-dev
./upload_firebase.sh android-prod-apk
./upload_firebase.sh android-prod-aab
./upload_firebase.sh ios-prod
./upload_firebase.sh ios-dev
```

## Useful Env Vars

- `FIREBASE_GROUPS`: comma-separated Firebase tester group aliases.
- `FIREBASE_TESTERS`: comma-separated tester emails.
- `FIREBASE_RELEASE_NOTES`: inline release notes.
- `FIREBASE_RELEASE_NOTES_FILE`: path to a release notes file.
- `FIREBASE_DEBUG`: set to `true` to enable verbose Firebase App Distribution logs.
- `GOOGLE_APPLICATION_CREDENTIALS`: service account JSON path.
- `FIREBASE_TOKEN`: Firebase CLI token, if used instead of CLI login or service account.
- `FIREBASE_ANDROID_DEV_APK_PATH`: override development APK path.
- `FIREBASE_ANDROID_PROD_APK_PATH`: override production APK path.
- `FIREBASE_ANDROID_PROD_AAB_PATH`: override production AAB path.
- `FIREBASE_IOS_PROD_IPA_PATH`: override production IPA path.
- `FIREBASE_IOS_DEV_IPA_PATH`: override development IPA path.
- `IOS_EXPORT_METHOD`: export method used by `flutter build ipa`.
