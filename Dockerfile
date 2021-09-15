FROM centos:centos8

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-centos-centos6-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-centos-centos6-action"

LABEL "com.github.actions.name"="check-ansible-centos-centos6"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS centos6"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum update --assumeyes
RUN rpm -ivh https://archives.fedoraproject.org/pub/archive/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN yum install --assumeyes libffi-devel \
    openssl-devel \
    git gcc \
    bzip2-devel \
    wget \
    ansible

ADD https://raw.githubusercontent.com/gdraheim/docker-systemctl-images/master/files/docker/systemctl.py /usr/bin/systemctl
RUN ansible --version
RUN python --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
