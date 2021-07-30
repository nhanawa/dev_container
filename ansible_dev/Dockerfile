FROM centos8_ssh:latest

# Install required packages
RUN yum -y update; yum clean all
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

# Reflesh Shims
RUN /usr/local/pyenv/bin/pyenv rehash
