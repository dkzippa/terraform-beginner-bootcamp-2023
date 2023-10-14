#!/usr/bin/env bash

cd $HOME

echo "PROJECT_ROOT: $PROJECT_ROOT"

cd /workspace
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" > "awscliv2.zip"

unzip -o awscliv2.zip

sudo ./aws/install --update

aws --version

aws sts get-caller-identity # check identity is configured correctly

cd $PROJECT_ROOT
