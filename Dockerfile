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

ADD https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py /etc/ansible/hosts
RUN chmod a+x /etc/ansible/hosts

COPY etc/ansible.cfg /etc/ansible/
COPY etc/ec2.ini /etc/ansible/

COPY playbook/ ./
