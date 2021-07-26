FROM centos8_ssh:latest

RUN yum -y update; yum clean all
RUN yum install -y git gcc make

RUN git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv
RUN echo "export PYENV_ROOT=/usr/local/pyenv"
RUN export PATH="${PYENV_ROOT}/bin:${PATH}"
RUN eval "$(/usr/local/pyenv/bin/pyenv init -)" >> /etc/profile.d/pyenv.sh
RUN exec $SHELL -l

RUN yum -y install bzip2-devel gcc-c++ libffi-devel openssl-devel readline-devel sqlite-devel zlib-devel

RUN sudo -i
RUN /usr/local/pyenv/bin/pyenv install 3.9.1
RUN /usr/local/pyenv/bin/pyenv global 3.9.1
RUN /usr/local/pyenv/bin/pyenv rehash

RUN sudo dnf install python38 -y
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python3
RUN which pip3

RUN /usr/local/pip3/bin/pip3 install --upgrade pip

RUN /usr/local/pip3/bin/pip3 install epel-release
RUN /usr/local/pip3/bin/pip3 install ansible
RUN /usr/local/pip3/bin/pip3 install ansible-lint
RUN /usr/local/pip3/bin/pip3 install yamllint
