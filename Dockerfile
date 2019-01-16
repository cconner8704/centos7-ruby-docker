FROM centos:7
#FROM arm32v7/centos:latest
#Based on https://tecadmin.net/install-ruby-latest-stable-centos/
MAINTAINER Chris Conner <chrism.conner@gmail.com>

ARG ruby_ver=2.5
RUN set -ex                           \
    && yum install -y epel-release \
    && yum update -y \
    && yum install epel-release -y \
    && yum update -y \
    && yum install -y python-pip \
    && yum install -y net-tools \
    && yum install -y bind-utils \
    && yum install -y iproute \
    && yum install -y vim \
    && yum install -y syslinux \
    && yum install -y less \
    && yum install -y gcc-c++ \
    && yum install -y patch \
    && yum install -y readline \
    && yum install -y readline-devel \
    && yum install -y zlib \
    && yum install -y zlib-devel \
    && yum install -y libyaml-devel \
    && yum install -y libffi-devel \
    && yum install -y openssl-devel \
    && yum install -y make \
    && yum install -y bzip2 \
    && yum install -y autoconf \
    && yum install -y automake \
    && yum install -y libtool \
    && yum install -y bison \
    && yum install -y iconv-devel \
    && yum install -y sqlite-devel \
    && yum clean -y expire-cache

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -L get.rvm.io | bash -s stable

RUN source /etc/profile.d/rvm.sh && rvm reload

RUN rvm install $ruby_ver

RUN rvm use $ruby_ver --default

# entrypoint
CMD [ "irb" ]
