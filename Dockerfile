FROM phusion/baseimage
MAINTAINER Christopher A. Mosher <cmosher@zillion.com>

RUN \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -o Dpkg::Options::="--force-confold" -o Dpkg::Options::="--force-confdef" && \
	apt-get autoremove && \
	apt-get clean

RUN \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ansible python-boto && \
	apt-get autoremove && \
	apt-get clean

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
