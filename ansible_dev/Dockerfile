FROM centos8_ssh:latest

RUN yum -y update; yum clean all
RUN yum install -y git gcc make


RUN echo "alias cp='cp -i'" >> /root/.bashrc
RUN echo "alias mv='mv -i'" >> /root/.bashrc
RUN echo "alias rm='rm -i'" >> /root/.bashrc
RUN echo "alias la='ls -al'" >> /root/.bashrc
RUN echo "alias ll='ls -l'" >> /root/.bashrc

RUN git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv
ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PATH}"
# ENV eval "$(/usr/local/pyenv/bin/pyenv init -)" >> /etc/profile.d/pyenv.sh
RUN eval "$(/usr/local/pyenv/bin/pyenv init --path)"
RUN echo 'eval "$(/usr/local/pyenv/bin/pyenv init --path)"' >> /etc/profile.d/pyenv.sh

RUN yum -y install bzip2-devel gcc gcc-c++ git libffi-devel make openssl-devel readline-devel sqlite-devel zlib-devel

RUN sudo -i
RUN /usr/local/pyenv/bin/pyenv install 3.8.6
RUN /usr/local/pyenv/bin/pyenv global 3.8.6
RUN /usr/local/pyenv/bin/pyenv rehash

# RUN sudo dnf install python36 -y
# RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python3

RUN pip3 install --upgrade pip

RUN pip3 install pipenv

#RUN pipenv install ansible==2.10.3
#RUN pipenv install ansible-lint==5.0.12
#RUN pipenv install yamllint==1.26.0

COPY Pipfile /
COPY Pipfile.lock /
# RUN pipenv sync
RUN pipenv install --system
