# HOW TO BUILD THIS IMAGE
# -----------------------
# Put jdk-8u171-linux-x64.tar.gz in the same directory as this Dockerfile
# Building: 
#      $ docker build -t ubuntu-jdk:8u171 . 
#
# Running:
#      $ docker run -i -t ubuntu-jdk:8u171

#Download base image
FROM ubuntu:18.04

ENV JDK_PKG=jdk-8u171-linux-x64.tar.gz
ENV JDK_HOME=/opt/jdk1.8.0_171
ENV JAVA_HOME=$JDK_HOME
ENV PATH=$PATH:$JAVA_HOME/bin

# Update Ubuntu Software repository
RUN apt-get update

COPY $JDK_PKG /opt

WORKDIR /opt

RUN tar -xzvf $JDK_PKG && \
    rm -rf $JDK_PKG

WORKDIR /