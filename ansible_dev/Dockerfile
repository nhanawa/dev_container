FROM centos: 8

RUN yum -y update; yum clean all
RUN yum install -y git

RUN git clone https://github.com/pyenv/pyenv.git /usr/local/pyenv
RUN echo "export PYENV_ROOT="/usr/local/pyenv"\n\
export PATH="\${PYENV_ROOT}/bin:\${PATH}"\n\
eval "\$(pyenv init -)" >> /etc/profile.d/pyenv.sh
RUN exec $SHELL -l

RUN sudo -i
RUN pyenv install 3.9.1
RUN pyenv global 3.9.1
RUN pyenv rehash

RUN pip install --upgrade pip

RUN pip install epel-release
RUN pip install ansible
RUN pip install ansible-lint
RUN pip install yamllint
