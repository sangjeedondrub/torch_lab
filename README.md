# `PyTorch` with `Jupyterlab`

> Developing environment with `docker` and `jupyterlab` for deep learning research in `PyTorch`

```
docker-compose up
```

And visit http://localhost:10010 to reach `jupyterlab`

## Issue fixings

### `ImportError: libGL.so.1` for `torchvideo`

Add following to `Dockerfile`

```bash
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y
```
