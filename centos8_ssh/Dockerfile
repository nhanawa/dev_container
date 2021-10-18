FROM centos:centos8
ENV container docker

RUN echo 'nameserver 240b:c0e0:101:5476:1c01:2::a' > /etc/resolv.conf && echo 'proxy=http://[240b:c0e0:101:5476:1c01:2::a]:3128' >> /etc/yum.conf

RUN yum -y update; yum clean all
RUN yum install -y wget net-tools vim
RUN yum groupinstall -y "Development Tools"

RUN systemctl mask dev-mqueue.mount dev-hugepages.mount \
    systemd-remount-fs.service sys-kernel-config.mount \
    sys-kernel-debug.mount sys-fs-fuse-connections.mount \
    display-manager.service graphical.target systemd-logind.service

RUN yum -y install openssh-server sudo openssh-clients
RUN sed -i 's/#PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN ssh-keygen -q -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    ssh-keygen -q -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
    ssh-keygen -q -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
RUN echo 'root:pass' | chpasswd
ADD sshd /etc/pam.d/sshd
RUN systemctl enable sshd.service

# firewalld needs this .. and I needs my firewalld
# ADD dbus.service /etc/systemd/system/dbus.service
RUN systemctl enable dbus.service

VOLUME [ "/sys/fs/cgroup" ]
VOLUME ["/run"]

EXPOSE 22

# Add .vimrc
COPY ./vimrc/.vimrc /root/
COPY ./vimrc/en.utf-8.add /usr/share/vim/vimfiles/spell/en.utf-8.add

# Add .bash configuration
COPY ./.bashrc /root/
RUN echo "alias cp='cp -i'" >> /root/.bashrc
RUN echo "alias mv='mv -i'" >> /root/.bashrc
RUN echo "alias rm='rm -i'" >> /root/.bashrc
RUN echo "alias la='ls -al'" >> /root/.bashrc
RUN echo "alias ll='ls -l'" >> /root/.bashrc


CMD ["/usr/sbin/init"]

