# gcloud_auth
 # Add the json keyfile and replace the following values in config.file. Add config.file to gitnore
service_account=<service_account@project.iam.gserviceaccount.com>
service_account_keyfile_name=<project-rando.json>
service_account_project=<project>
path_to_google_cloud_sdk=<objective path to google-cloud-sdk>
gcloud_auth=<objective path to gcloud_auth>

# calling
path_to_gcloud_auth=../gcloud_auth
gcloud_command="gcloud some command"
gcloud_command_result=$(/bin/bash $path_to_gcloud_auth/gcloud_auth.sh "$gcloud_command")
