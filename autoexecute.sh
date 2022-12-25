#!/bin/bash
echo "-------------------------------------------------------------"
echo "Welcome to the auto-installation process of Som's GCP TTS API"
echo "-------------------------------------------------------------"
echo "* Cloning the Repo"
# Clone the repository
git clone https://github.com/Som23Git/GCP-TTS-API-and-Python-Script

# Change into the repository directory
cd GCP-TTS-API-and-Python-Script

# Check if gcloud is installed
echo "* Checking whether the gcloud SDK is installed"
if ! command -v gcloud &> /dev/null; then
  # Install the gcloud package
  echo "* gcloud is not installed. Installing now..."
  brew install google-cloud-sdk
else
  echo "* gcloud is already installed in this machine so going ahead!!"
  echo " "
  echo "* Below is the gcloud packages"
  gcloud -v
fi

# Run gcloud init
echo "-------------------------------"
echo "INITIALIZE YOUR GCLOUD ACCOUNT"
echo "--------------------------------"
gcloud init

# Run the following command to confirm that you are authenticated to the appropriate account
echo "--------------------------"
echo "CHECK THE GCLOUD ACCOUNT"
echo "--------------------------"
gcloud auth list

# Run the following command to confirm that the gcloud command knows about your project
echo "-------------------------------"
echo "CONFIRM the PROJECT AND IT'S ID"
echo "-------------------------------"
gcloud config list project

# Enable the gcloud Text-to-Speech API
echo "-------------------------------"
echo "ENABLING TEXT-TO-SPEEECH API"
echo "-------------------------------"
gcloud services enable texttospeech.googleapis.com

# To Authenticate API Request should set the Environment Variables
echo "* Exporting PROJECT ID"
export PROJECT_ID=$(gcloud config get-value core/project)

# Create a new service account to access the Text-to-Speech API
echo "* Creating the new service account, it is only required once. You can ignore if its already exists"
gcloud iam service-accounts create my-tts-sa --display-name "my tts service account"

# Grant the service account the permission to use the service
echo "* Granting Permissions to the service account"
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member serviceAccount:my-tts-sa@${PROJECT_ID}.iam.gserviceaccount.com --role roles/serviceusage.serviceUsageConsumer

# Create credentials that your Python code will use to login as your new service account. Create and save these credentials as a ~/key.json JSON file by using the following command



