#!/bin/bash

sudo sed -i "/version: / c\version: $VERSION+$BUNDLE_NAME" ./pubspec.yaml
