FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

EXPOSE 8888

WORKDIR /workspace
COPY requirements.txt .
COPY config/ /root/.jupyter/
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
      && sed -i '/security/d' /etc/apt/sources.list \
      && export DEBIAN_FRONTEND=noninteractive \
      && apt update -y \
      && apt install -y tzdata curl \
      && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
      && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
      && dpkg-reconfigure --frontend noninteractive tzdata \
      && apt install -y ffmpeg libsm6 libxext6 \
      && apt-get clean \
      && apt-get autoremove -y \
      && rm -rf /var/lib/apt/lists/* \
      && pip install pip -U \
      && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
      && pip install -r requirements.txt
