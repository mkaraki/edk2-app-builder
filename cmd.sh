#!/bin/bash

cmdargs=$@

source /edk2/edksetup.sh &> /dev/null

SourceEnv

/bin/bash -c "$cmdargs"