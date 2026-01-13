#!/bin/bash

fvm flutter clean
fvm flutter pub get
cd ios
pod deintegrate
rm -rf Podfile.lock
rm -rf Pods
pod install --repo-update
