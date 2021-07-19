FROM centos8_ssh:latest

RUN yum -y update; yum clean all
RUN yum install -y git gcc make

RUN git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv
RUN echo "export PYENV_ROOT=/usr/local/pyenv"
RUN export PATH="${PYENV_ROOT}/bin:${PATH}"
RUN eval "$(/usr/local/pyenv/bin/pyenv init -)" >> /etc/profile.d/pyenv.sh
RUN exec $SHELL -l

RUN sudo -i
RUN /usr/local/pyenv/bin/pyenv install 3.9.1
RUN /usr/local/pyenv/bin/pyenv global 3.9.1
RUN /usr/local/pyenv/bin/pyenv rehash

RUN pip install --upgrade pip

RUN pip install epel-release
RUN pip install ansible
RUN pip install ansible-lint
RUN pip install yamllint
