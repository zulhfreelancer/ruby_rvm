FROM ubuntu:16.04

LABEL maintainer="zulh@hellogold.com"
ENV RUBY_VERSION=2.4.1

# RVM dependencies - might take some time to finish
RUN apt-get -qy update && apt-get install -qy curl \
                                            patch \
                                            bzip2 \
                                            gawk \
                                            g++ \
                                            gcc \
                                            make \
                                            libc6-dev \
                                            patch \
                                            zlib1g-dev \
                                            libyaml-dev \
                                            libsqlite3-dev \
                                            sqlite3 \
                                            autoconf \
                                            libgmp-dev \
                                            libgdbm-dev \
                                            libncurses5-dev \
                                            automake \
                                            libtool \
                                            bison \
                                            pkg-config \
                                            libffi-dev \
                                            libgmp-dev \
                                            libreadline6-dev \
                                            libssl-dev \
                                            ca-certificates \
                                            --fix-missing --no-install-recommends

# cleaning up the apt-get cache
RUN rm -rf /var/lib/apt/lists/*

# RVM & Ruby - keep gpg line in one single long line
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby=$RUBY_VERSION
RUN echo '. /etc/profile.d/rvm.sh\n' >> ~/.profile

# -l makes bash act as if it had been invoked as a login shell and init ~/.profile
ENTRYPOINT /bin/bash -l
