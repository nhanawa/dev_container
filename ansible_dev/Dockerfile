FROM centos8_ssh:latest

# Install required packages
RUN yum -y update
RUN yum install -y git gcc make bzip2-devel gcc gcc-c++ git libffi-devel make openssl-devel readline-devel sqlite-devel zlib-devel

# Clone pyenv & initial settings
RUN git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv
ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"
RUN echo 'eval "$(/usr/local/pyenv/bin/pyenv init --path)"' >> /etc/profile.d/pyenv.sh

# Install pyenv
RUN /usr/local/pyenv/bin/pyenv install 3.8.6
RUN /usr/local/pyenv/bin/pyenv global 3.8.6
RUN /usr/local/pyenv/bin/pyenv rehash

# Install Ansible & related packages for dev
RUN pip3 install --upgrade pip
RUN pip3 install pipenv

# Install Pakcages
RUN mkdir /opt/pipenv
COPY Pipfile /opt/pipenv
COPY Pipfile.lock /opt/pipenv
RUN cd /opt/pipenv; pipenv install --system
RUN pip3 install molecule pre-commit molecule-docker jmespath netaddr selinux
RUN yum install -y python3-libselinux

# Reflesh Shims
RUN /usr/local/pyenv/bin/pyenv rehash

# Install Docker for molecule
RUN yum install -y yum-utils
RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
RUN yum-config-manager --disable docker-ce-nightly
RUN yum install -y docker-ce-cli
RUN yum clean all

# Environment variablees
ENV HTTP_PROXY http://[240b:c0e0:101:5476:1c01:2::a]:3128
ENV HTTPS_PROXY http://[240b:c0e0:101:5476:1c01:2::a]:3128
ENV http_proxy http://[240b:c0e0:101:5476:1c01:2::a]:3128
ENV https_proxy http://[240b:c0e0:101:5476:1c01:2::a]:3128
ENV NO_PROXY gitlab-docker-reg.local,240b:c0e0:103:53e9:1:2:0:2,localhost,127.0.0.1
ENV no_proxy gitlab-docker-reg.local,240b:c0e0:103:53e9:1:2:0:2,localhost,127.0.0.1

