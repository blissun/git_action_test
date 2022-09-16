#!/bin/bash

sudo sed -i '' "/enabledConfig/ c\\
    \"enabledConfig\": \"$SERVER\"," ./assets/config/project_config.json
