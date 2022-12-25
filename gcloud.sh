#!/bin/bash
echo "-------------------------------------------------------------"
echo "Welcome to the auto-installation process of Som's GCP TTS API"
echo "-------------------------------------------------------------"
echo "* Cloning the Repo"

if ! command -v gcloud &> /dev/null; then
  # Install the gcloud package
  echo "gcloud is not installed. Installing now..."
  brew install google-cloud-sdk
else
  echo "* gcloud is already installed in this machine so going ahead!!"
  echo " "
  echo "* Below is the gcloud packages"
  gcloud -v
fi

