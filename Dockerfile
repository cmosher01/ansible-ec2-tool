FROM centos
MAINTAINER Christopher A. Mosher <cmosher@zillion.com>

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y ansible openssh-clients python-boto

ENV TERM linux
ENV HOME /root
WORKDIR $HOME

COPY etc/ssh_config /etc/ssh/

ENV ANSIBLE_HOSTS /etc/ansible/ec2.py
ADD https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py $ANSIBLE_HOSTS
RUN chmod a+x $ANSIBLE_HOSTS

COPY etc/ansible.cfg /etc/ansible/
COPY etc/ec2.ini /etc/ansible/

COPY playbook/ ./
