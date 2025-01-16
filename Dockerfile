FROM ubuntu:22.04

LABEL description="Yocto Build Environment based on Ubuntu 22.04" \
      version="1.0" \
      name="yocto-build-env-ub22"

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    gawk \
    wget \
    git-core \
    diffstat \
    unzip \
    texinfo \
    gcc-multilib \
    build-essential \
    chrpath \
    socat \
    cpio \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils \
    debianutils \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    python3-subunit \
    zstd \
    liblz4-tool \
    file \
    locales \
    libacl1 \
    make \
    inkscape \
    texlive-latex-extra \
    sphinx \
    python3-saneyaml \
    python3-sphinx-rtd-theme \
    vim \
    curl \
    xterm \
    sudo \
    ifupdown \
    net-tools \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Install repo
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+x /bin/repo

# Set working directory
WORKDIR /workdir

# Set environment variables
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

CMD ["/bin/bash"]
