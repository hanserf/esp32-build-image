FROM python:3-buster

LABEL \
  python.version=3 \
  debian.version=buster

RUN \
  apt-get update && \
  apt-get install -y \
  wget \
  unzip \
  python3-pip \
  python3-setuptools \
  tar \
  make \
  tree \
  flex \
  bison \
  gperf \
  cmake \
  ninja-build \
  ccache \
  libffi-dev \
  libssl-dev \
  dfu-util && \
  update-alternatives --install /usr/bin/python python /usr/bin/python3 10

  
WORKDIR /opt/esp32
RUN git clone https://github.com/espressif/esp-idf.git &&\
  cd esp-idf &&\
  git checkout v4.0.2 &&\
  git submodule update --init --recursive &&\
  bash install.sh
  
ENV MY_IDF_PATH="/opt/esp32/esp-idf"
ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"

CMD ["/bin/bash"]
