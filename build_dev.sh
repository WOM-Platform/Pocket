#!/bin/sh

fvm flutter build apk --flavor development -t ./lib/main_dev.dart
echo "apk dev built"