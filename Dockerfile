FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  nasm \
  g++ \
  make \
  gcc \
  uuid-dev \
  git \
  python \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 --recursive https://github.com/tianocore/edk2.git /edk2

WORKDIR /edk2

SHELL ["/bin/bash", "-c"]

RUN source ./edksetup.sh
RUN alias build="/edk2/BaseTools/BinWrappers/PosixLike/build"

RUN make -C $PWD/BaseTools/Source/C

COPY cmd.sh /cmd.sh

ENTRYPOINT ["/bin/bash", "/cmd.sh"]
