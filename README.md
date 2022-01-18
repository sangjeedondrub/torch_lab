# `PyTorch` with `Jupyterlab` + `Docker`

> Developing environment with `docker` and `jupyterlab` for deep learning research in `PyTorch`

Change your `PASSWORD` in `.docker.env` and run

```
docker-compose up
```

And visit http://localhost:10011 to reach `jupyterlab`

## TODO

- [ ] Use `datascience-notebook/base-notebook` as base image, [Dockerfile](https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile)
- [ ] Try [Deepo](https://github.com/ufoym/deepo)

## Issues

### `ImportError: libGL.so.1` for `torchvideo`

Add the following to `Dockerfile`

```bash
RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6 -y
```

# Test cuda

```
docker create -it --gpus all -p 7777:8898 --name torch -v .:/workspace pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime
```
