## Text-to-Speech Setup using the GCP Cloud API

<div align="center"> 
<img src="./assets/GCP_small.png"/> 
<img src="./assets/TTS_small.png"/>
<img src="./assets/Python_small.png"/>
<img src="./assets/API_small.png"/>  
</div>




-------

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

### * Implementation

It is a straight-forward implementation, you should make sure to use the `Gcloud Libraries and Packages` to create an fail-free enivironment. 

Just download the package and start the above `Python Command` to kickstart your experience in the `Text-To-Speech`.

**Thanks for checking this out!!**
