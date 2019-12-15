# Ansible EC2 Tool

Copyright © 2016, 2017, Christopher Alan Mosher, Shelton, Connecticut, USA, <cmosher01@gmail.com>.

[![License](https://img.shields.io/static/v1?label=license&message=GPL-3.0&color=orange)](https://www.gnu.org/licenses/gpl.html)

Runs Ansible against AWS EC2 instances. To use, add roles to the playbook.
An example role "Debug" is included.

### Prerequisites

* install make, docker, docker-compose
* edit .env for your environment

### Running

`make`

or

`make hosts=tag_environment_chocolate`

to limit hosts to those with a certain tag value.
