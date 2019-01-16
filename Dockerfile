FROM centos:7
#FROM arm32v7/centos:latest
#Based on https://tecadmin.net/install-ruby-latest-stable-centos/
#https://github.com/drecom/docker-centos-ruby/blob/master/Dockerfile
MAINTAINER Chris Conner <chrism.conner@gmail.com>

ARG RUBY_PATH=/usr/local/
ARG RUBY_VERSION=2.6.0

RUN set -ex                           \
    && yum install -y epel-release \
                      python-pip \
                      net-tools \
                      bind-utils \
                      iproute \
                      vim \
                      syslinux \
                      less \
                      make \
                      gcc \
                      git \
                      openssl-dev \
                      zlib-devel \
                      mysql-devel \
                      redis \
                      sqlite-devel \
    && yum update -y \
    && yum clean -y expire-cache

ENV PATH $RUBY_PATH/bin:$PATH

RUN git clone git://github.com/rbenv/ruby-build.git $RUBY_PATH/plugins/ruby-build \
    && $RUBY_PATH/plugins/ruby-build/install.sh

RUN ruby-build $RUBY_VERSION $RUBY_PATH

# entrypoint
CMD [ "irb" ]
