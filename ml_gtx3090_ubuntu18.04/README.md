# docker-compose configuration for PyTorch

This is a docker-compose configuration for PyTorch users. You will have a docker container running Visdom server. A volume is mounted on this container.

pip packages provided on this image is given in copy/requirements.txt

```
matplotlib==3.3.4
numpy==1.19.5
opencv-python==4.5.1.48
Pillow==8.1.2
cython
scikit-learn==0.24.1
scipy==1.5.4
torch==1.8.1+cu111
torchaudio==0.8.1
torchvision==0.9.1+cu111
tqdm==4.59.0
visdom==0.1.8.9
pycocotools==2.0.2
jupyterlab


```

apt packages provided on this image is given in Dockerfile-dev

- build-essential
- git
- zsh
- wget
- curl
- ssh
- tmux
- python3-distutils
- python3-dev
- libgl1-mesa-glx

## build

### Prepare an ssh key for the container

this is for accessing the docker container. you should have at least one ssh key pair to access this container. Following command is enough.

```
$ ssh-keygen -t rsa -C "your comment"
```

After preparing public key files, move them into "ml_gtx3090_ubuntu18.04/copy/pub/"

### Writing .env file

This repository has a template.env file in repo root dir. you should replace all values of environment variables and rename that file into '.env', which is the default name of the docker environment variable file.

```
NVIDIA_VISIBLE_DEVICES=all
PORT_SSH=00000
PORT_VISDOM=00000
PORT_JUPYTER=00000
```

- NVIDIA_VISIBLE_DEVICES is GPU device indices that you want to make visible to the container based on this image. this is "all" on typical cases.
- PORT_SSH is a secure shell service port.
- PORT_VISDOM is Visdom web service port.
- PORT_JUPYTER is jupyterlab web service port.

### Volume

In th docker-compose.yml file, you will see a volume definition.

```
volumes:
  source:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ${HOME}/repos

   dataset:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /media/${USER}/Data/dataset
```

You can set the device attribute to any directory you want.

### Building the Image

This is the last step to build an image.

```
$ docker-compose build
```

## Create A container

If you want to create a container and to run it as a daemon, run following command.

```
$ docker-compose up -d
```

Or, If you want to create a container and to run it on the shell, run following command.

```
$ docker-compose up
```

## Access to the container

Create a "config" file in your .ssh directory. (e.g. ~/.ssh/config )
This is an example of configuration.

```
Host docker_pytorch
    Port 00000 #port you set in the .env file
    HostName 000.000.000.000 # container_hosting_server
    User root # this is fixed
    IdentityFile your_private_key_path
```

Save it and access ssh with your key.

```
$ ssh docker_pytorch
```
