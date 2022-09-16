#!/bin/bash

sudo sed -i '' "/CURRENT_PROJECT_VERSION = */ c\\
				CURRENT_PROJECT_VERSION = $BUNDLE_NAME;" ./ios/Runner.xcodeproj/project.pbxproj
sudo sed -i '' "/MARKETING_VERSION = */ c\\
				MARKETING_VERSION = $VERSION;" ./ios/Runner.xcodeproj/project.pbxproj