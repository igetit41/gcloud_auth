#!/bin/bash

while getopts gcloud_command: flag
do
    case "${flag}" in
        gcloud_command) gcloud_command=${OPTARG};;
    esac
done
echo "gcloud_command: $gcloud_command"

#Copy this whole folder one directory up, add the json keyfile, and replace the following variables.
service_account=<service_account@project.iam.gserviceaccount.com>
service_account_keyfile_name=<project-rando.json>
service_account_project=<project>
path_to_google_cloud_sdk=<objective path to google-cloud-sdk>

export PATH="$path_to_google_cloud_sdk/google-cloud-sdk/bin:$PATH"

set_account=$(gcloud config set account $service_account)
echo "$set_account"

activate_account=$(gcloud auth activate-service-account --key-file=./$service_account_keyfile_name --project=$service_account_project)
echo "$activate_account"

gcloud_command_result=$($gcloud_command)
echo "$gcloud_command_result"
