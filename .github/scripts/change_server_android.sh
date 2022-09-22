#!/bin/bash
# todo.env SERVER_URL 변경하는걸로
sudo sed -i "/enabledConfig/ c\    \"enabledConfig\": \"$SERVER\"," ./assets/config/project_config.json
