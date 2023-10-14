#!/usr/bin/env bash

# https://servian.dev/terraform-local-providers-and-registry-mirror-configuration-b963117dfffa
cd $PROJECT_ROOT

PROVIDER_PLUGIN_FILENAME=terraform-provider-terratowns_v1.0.0
PROVIDER_PLUGIN_DIR="$HOME/.terraform.d/plugins/local.providers/local/terratowns/1.0.0"

cp "$PROJECT_ROOT/terraformrc.example" "$HOME/.terraformrc"

rm -rf "$HOME/.terraform.d/plugins/"
rm -rf "$PROJECT_ROOT/.terraform"
rm -f "$PROJECT_ROOT/.terraform.lock.hcl"

mkdir -p "$PROVIDER_PLUGIN_DIR/x86_64/"
mkdir -p "$PROVIDER_PLUGIN_DIR/linux_amd64/"


cd "$PROJECT_ROOT/terraform-provider-terratowns" || exit

go build -o $PROVIDER_PLUGIN_FILENAME
cp "./$PROVIDER_PLUGIN_FILENAME" "$PROVIDER_PLUGIN_DIR/x86_64/"
cp "./$PROVIDER_PLUGIN_FILENAME" "$PROVIDER_PLUGIN_DIR/linux_amd64/"

echo "$PROVIDER_PLUGIN_DIR/x86_64/ ->> "
ls -ailh "$PROVIDER_PLUGIN_DIR/x86_64/"

echo "$PROVIDER_PLUGIN_DIR/linux_amd64/ ->> "
ls -ailh "$PROVIDER_PLUGIN_DIR/linux_amd64/"

cd $PROJECT_ROOT
