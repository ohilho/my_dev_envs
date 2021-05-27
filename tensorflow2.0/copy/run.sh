#! /bin/bash

service ssh start
tensorboard --logdir=/repos/log --port=6006 --host=0.0.0.0
