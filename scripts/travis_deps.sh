#!/usr/bin/env sh
##
## Copyright (c) 2015, 2016, 2017, 2018, 2019 The University of Utah
## Copyright (c) 2015 Tamir Duberstein
## All rights reserved.
##
## This file is distributed under the University of Illinois Open Source
## License.  See the file COPYING for details.
##

###############################################################################

# This script is run under "sudo".  See file ".travis.yml".

set -eux

apt-get update -qq

# The Travis-CI Ubuntu 16.04 ("xenial") build environment has LLVM and Clang
# preinstalled.  They interfere with our installations of these packages.
apt-get remove -y -qq \
    clang \
    llvm \
    llvm-runtime

# Install programs "add-apt-repository" and "wget", needed below.
apt-get install -y -qq \
    software-properties-common \
    wget

# Set up for installing LLVM 8.0.
# See <https://wiki.ubuntu.com/ToolChain>.
# See <http://llvm.org/apt/>.
add-apt-repository -y \
    ppa:ubuntu-toolchain-r/test
add-apt-repository -y \
    'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main'
wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
apt-get update -qq

# Install LLVM 8.0.  See file "INSTALL.md".
apt-get install -y -qq \
    llvm-8 \
    llvm-8-dev \
    clang-8 \
    libclang-8-dev \
    clang-format-8 \
    libedit-dev

# Install other C-Reduce dependencies.  See file "INSTALL.md".
apt-get install -y -qq \
    libexporter-lite-perl \
    libfile-which-perl \
    libgetopt-tabular-perl \
    libregexp-common-perl \
    libterm-readkey-perl \
    flex \
    build-essential \
    zlib1g-dev

###############################################################################

## End of file.
