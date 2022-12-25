## Text-to-Speech Setup using the GCP Cloud API with Python Client

| GCP  | TTS  | Python  | API  |
|---|---|---|---|
|![GCP_small](https://user-images.githubusercontent.com/93936168/209451993-9080d2af-4b18-413b-9e5b-5e64800d6bea.png)|![TTS_small](https://user-images.githubusercontent.com/93936168/209451995-3b70b2c2-60e3-4311-a57a-4cfabb4b815a.png)|![Python_small](https://user-images.githubusercontent.com/93936168/209451994-25596bcd-b939-4d9d-9b1c-ae0ec8f20b70.png)|![API_small](https://user-images.githubusercontent.com/93936168/209451992-da8c7468-4263-4aff-b02c-3970d5fcf5db.png)| 

-------

#### * For Easy Installation - Execute the Script File 

``` 
autoexecute.sh
```
This `autoexecute.sh` script file does all your work for `preinstallation` and `text-to-speech` processing. Just follow the steps and confirm your environment is setup appropriately.

--------
### * Implementation

It is a straight-forward implementation, you should make sure to use the `Gcloud Libraries and Packages` to create an fail-free enivironment. 

##### + Checklists
- `gcloud -v`
- `python3 -V`
- `pip3 -V`
- `GCP Account`

Just download the package and start the `Python Command` to kickstart your experience in the `Text-To-Speech`.

--------

#### * To setup the GCP environment in local, start with the below command in the local Terminal
```
gcloud init
```

##### + [Authentication Use Cases](https://cloud.google.com/docs/authentication/use-cases)
##### + [How to Authenticate using Client Libraries](https://cloud.google.com/docs/authentication/client-libraries)
##### + [Use Service Account Keys to Authenticate](https://cloud.google.com/docs/authentication/provide-credentials-adc#local-key)

Make sure you create a service account and download the `service-account.json` key and export it as an `GOOGLE_APPLICATION_CREDENTIALS`.

-------

### * Github Source:
#### + Topic 1: [Read SSML from a text/ssml file](https://github.com/GoogleCloudPlatform/python-docs-samples/blob/HEAD/texttospeech/snippets/synthesize_file.py)

#### + Topic 2: [Text to Speech using text/ssml](https://github.com/GoogleCloudPlatform/python-docs-samples/blob/HEAD/texttospeech/snippets/synthesize_text.py)


### * GCP Documentation:
#### + Topic 3: [TTS Synthesize SSML File](https://cloud.google.com/text-to-speech/docs/samples/tts-synthesize-ssml-file)

#### + Topic 4: [SSML Documentation](https://cloud.google.com/text-to-speech/docs/ssml)

-------

### * Prerequisite Commands in `Google Codelabs`:
#### + Topic 5: [Using the Text-to-Speech API with Python](https://codelabs.developers.google.com/codelabs/cloud-text-speech-python3#8)

-------

#### * Read SSML from Text File 

```
synthesize_text_file(text_file);
```

This `function` will fetch the `input_file.txt` from the input arguments and will send it to GCP instance that you have instantiated. Once, it is processed, you'll get a `output.mp3` file.

To pass the arguments and to run the `Python` Script

```
python3 synthesize_file.py --text input_file.txt
```


#### * Read SSML from SSML File 

```
synthesize_text_file(ssml_file);
```

It is similar to the above text file. This `function` will fetch the `input_file.ssml` from the input arguments and will send it to GCP instance that you have instantiated. Once, it is processed, you'll get a `output.mp3` file.

To pass the arguments and to run the `Python` Script


```
python3 synthesize_file.py --ssml input_file.ssml
```

-------

#### * Follow For More:
[image](https://medium.com/@somesh-rokz)

### **Thanks for checking this out!!** :heart:

