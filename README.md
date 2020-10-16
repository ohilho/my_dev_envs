# Dockerized Development Environments
This repository provides dockerized private development envrionment.

## List of Development Environments
- ml-server
- code-server

## ml-server
Dockerized Machine Learning server.
This docker-compose provides 2 services.
- jupyter
- tensorboard

### Service : jupyter
This is jupyter notebook environment. you can write python code on this notebook. 
tensorflow with gpu, keras, pytorch is installed via pip. 
#### volumes
- "ml-server-source" is mounted at "/tf" 
- "ml-server-log" is mounted at "/tf/log"
#### ports
- port 8888 is open for the web browsers.

### Service: tensorboard
This is tensorboard. You can review your machine learning result with tensorboard.
#### volumes
- "ml-server-source" is mounted at "/tf" 
- "ml-server-log" is mounted at "/tf/log"
#### ports
- port 6006 is open for the web browsers.


## code-server
Dockerized visual studio code on web. The original project is code-server on the github "https://github.com/cdr/code-server"
#### volumes
- "code-server-source" is mounted at "/workspace"
#### ports
- port 8080 is open for the web browsers.
