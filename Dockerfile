# To buld, test and deploy Qt5 apps for multi-arch
FROM ubuntu:20.04

WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get -y update \
 && apt install -y                 \
        git                        \
        wget                       \
        software-properties-common \
        build-essential            \
        libssl-dev                 \
        libxcb1-dev                \
        libx11-dev                 \
        libgl1-mesa-dev            \
        libudev-dev                \
        build-essential            \
        libyaml-cpp-dev            \
        libfuse2

RUN  add-apt-repository ppa:beineri/opt-qt-5.15.4-focal \
 && apt-get -y update \
 && apt-get -y install qt515base qt515charts-no-lgpl qt515declarative \
 qt515quickcontrols2 qt515serialport qt515serialbus qt515connectivity \
 qt515svg qt515tools protobuf-compiler

ENV QT_BASE_DIR=/opt/qt515
ENV QTDIR=$QT_BASE_DIR
ENV PATH=$QT_BASE_DIR/bin:$PATH
ENV LD_LIBRARY_PATH=$QT_BASE_DIR/lib:$LD_LIBRARY_PATH
ENV PKG_CONFIG_PATH=$QT_BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

WORKDIR /home/root/

CMD ["/bin/bash"]
