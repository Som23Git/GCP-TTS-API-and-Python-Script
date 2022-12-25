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
echo "* Creating credentials and save it as a key.json file in the home directory"
gcloud iam service-accounts keys create ~/key.json --iam-account my-tts-sa@${PROJECT_ID}.iam.gserviceaccount.com

# Finally, set the GOOGLE_APPLICATION_CREDENTIALS environment variable, which is used by the Speech-to-Text client library, to find your credentials.
echo "* Exporting GOOGLE_APPLICATION_CREDENTIALS"
export GOOGLE_APPLICATION_CREDENTIALS=~/key.json

# Checking whether the Python3 is installed
echo "-------------------------------------"
echo " "
echo "* Checking whether the Python is installed"
# Check if Python 3 is installed
if ! command -v python3 > /dev/null; then
    # Install Python 3
    brew install python
else
    echo "Python3 is installed already"
    python3 -V
fi

# Check if pip3 is installed
if ! command -v pip3 > /dev/null; then
    # Install pip3
    python3 -m ensurepip --upgrade
else
    echo "pip3 is installed already"
    pip3 -V
fi

# Install Python Client Library
echo "-------------------------------------"
echo "INSTALLATION OF PYTHON CLIENT LIBRARY"
echo "-------------------------------------"
pip3 install --user --upgrade google-cloud-texttospeech

# All installation is completed

echo "------------------------------------------"
echo "XXX ALL PACKAGE INSTALLATION COMPLETED XXX"
echo "------------------------------------------"

# Prompt the user for input
read -p "Enter the text to be converted to speech: " input

# Write the input to a file
echo "$input" > xyz_file.txt
echo " "
echo "The text is added successfully to the file xyz_file.txt"

# Let's process the text file to the gcloud API
echo "-----------------------------"
echo "CONVERTING THE TEXT TO SPEECH"
echo "-----------------------------"
python3 synthesize_file.py --text xyz_file.txt

echo "-----------------------------"
echo "OUTPUT.MP3 IS READY!!!"
echo "-----------------------------"
