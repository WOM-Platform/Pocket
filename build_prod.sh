#!/bin/sh

fvm flutter build ipa --flavor production
echo "ipa built"
fvm flutter build appbundle --flavor production
echo "appbundle built"