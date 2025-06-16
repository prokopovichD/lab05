FROM ubuntu:22.04

WORKDIR /print

COPY . .

RUN apt-get update
RUN apt-get install -y gcc g++
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p _build
RUN rm -rf _build && mkdir -p _build
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
RUN rm -rf _build
