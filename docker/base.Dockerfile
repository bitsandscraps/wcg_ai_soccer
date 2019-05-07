ARG UBUNTU_MAJOR=18
ARG UBUNTU_MINOR=04
ARG UBUNTU_VERSION=${UBUNTU_MAJOR}.${UBUNTU_MINOR}

ARG ARCH=
ARG CUDA=10.0
FROM nvidia/cudagl:${CUDA}-runtime-ubuntu${UBUNTU_VERSION}
ARG UBUNTU_MAJOR
ARG UBUNTU_MINOR
ARG ARCH
ARG CUDA
ARG CUDNN=7.4.1.5-1
# which tensorflow to install
ARG TF=tensorflow
ARG WEBOTS=webots
ARG DEBIAN_FRONTEND=noninteractive

# Needed for string substitution 
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y --no-install-recommends \
        ubuntu-desktop
RUN apt-get update && apt-get install -y mpi mpich

RUN mkdir -p /root
WORKDIR /root

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cuda-command-line-tools-${CUDA/./-} \
        cuda-cublas-${CUDA/./-} \
        cuda-cufft-${CUDA/./-} \
        cuda-curand-${CUDA/./-} \
        cuda-cusolver-${CUDA/./-} \
        cuda-cusparse-${CUDA/./-} \
        curl \
        libcudnn7=${CUDNN}+cuda${CUDA} \
        libfreetype6-dev \
        libhdf5-serial-dev \
        libzmq3-dev \
        pkg-config \
        software-properties-common \
        unzip

RUN [[ "${ARCH}" = "ppc64le" ]] || { apt-get update && \
        apt-get install nvinfer-runtime-trt-repo-ubuntu${UBUNTU_MAJOR}${UBUNTU_MINOR}-5.0.2-ga-cuda${CUDA} \
        && apt-get update \
        && apt-get install -y --no-install-recommends libnvinfer5=5.0.2-1+cuda${CUDA} \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*; }

# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 --no-cache-dir install --upgrade pip setuptools

# Some TF tools expect a "python" binary
RUN ln -s $(which python3) /usr/local/bin/python 

COPY bashrc tensorflow*.whl webots*.deb ./
RUN apt-get update && apt-get install -y ./${WEBOTS}

RUN mkdir -p /root/.config/Cyberbotics/
COPY Webots-R2019a.conf /root/.config/Cyberbotics/

RUN pip3 --no-cache-dir install ${TF}

RUN mv bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc

# cleanup
RUN rm tensorflow*.whl ${WEBOTS}

COPY requirements.txt ./
RUN pip3 --no-cache-dir install -r ./requirements.txt
RUN rm ./requirements.txt

COPY webots.sh ./
RUN chmod u+x webots.sh
