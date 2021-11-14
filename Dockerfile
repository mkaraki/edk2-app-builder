FROM ubuntu

RUN apt-get update && apt-get install -y \
  nasm \
  g++ \
  make \
  gcc \
  uuid-dev \
  git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
 
RUN git clone --depth=1 --recursive https://github.com/tianocore/edk2.git /edk2
 
WORKDIR /edk2
 
RUN . ./edksetup.sh
RUN make -C $PWD/BaseTools/Source/C
