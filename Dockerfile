FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime

EXPOSE 8888

WORKDIR /workspace
COPY requirements.txt .
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
      apt update -y && \
      apt install ffmpeg libsm6 libxext6 -y && \
      pip install pip -U && \
      pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
      pip install -r requirements.txt