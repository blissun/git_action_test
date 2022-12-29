#!/bin/bash

sudo sed -i '' "/SERVER_URL/ c\\
    \"SERVER_URL\"=\"$SERVER_URL\"," ./.env
cat .env
