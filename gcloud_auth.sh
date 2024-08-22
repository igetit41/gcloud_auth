#!/bin/bash

source config.file

gcloud_command=$1
echo "gcloud_command: $gcloud_command"

export PATH="$path_to_google_cloud_sdk/google-cloud-sdk/bin:$PATH"

set_account=$(gcloud config set account $service_account)
if [[ $set_account != '' ]]; then
    echo "set_account: $set_account"
fi

activate_account=$(gcloud auth activate-service-account --key-file=$path_to_gcloud_auth/gcloud_auth/$service_account_keyfile_name --project=$service_account_project)
if [[ $activate_account != '' ]]; then
    echo "activate_account: $activate_account"
fi

gcloud_command_result=$($gcloud_command)
if [[ $gcloud_command_result != '' ]]; then
    echo "gcloud_command_result: $gcloud_command_result"
fi
