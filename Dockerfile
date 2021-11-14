FROM ubuntu

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

<<<<<<< HEAD
ENTRYPOINT ["/bin/bash", "/cmd.sh"]
=======
ENTRYPOINT /bin/bash /cmd.sh
>>>>>>> c7a4c29305b591291e5a7e896d4f6a37289aa914
