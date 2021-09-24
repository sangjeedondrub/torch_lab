# `PyTorch` with `Jupyterlab` + `Docker`

> Developing environment with `docker` and `jupyterlab` for deep learning research in `PyTorch`

Change your `PASSWORD` in `.docker.env` and run

```
docker-compose up
```

And visit http://localhost:10010 to reach `jupyterlab`

## Issues

### `ImportError: libGL.so.1` for `torchvideo`

Add the following to `Dockerfile`

```bash
RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6 -y
```
