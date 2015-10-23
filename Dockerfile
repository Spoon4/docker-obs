FROM ubuntu:14.04

MAINTAINER Spoon <spoon4@gmail.com>

RUN ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
              software-properties-common \
              python-software-properties \
    && add-apt-repository \
              "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse" \
    && add-apt-repository \
              ppa:kirillshkrogalev/ffmpeg-next \
    && add-apt-repository \
              ppa:obsproject/obs-studio

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
              ffmpeg \
              obs-studio \
    && apt-get clean -y
    
RUN export uid=1000 gid=1000
RUN mkdir -p /home/obs
RUN echo "obs:x:${uid}:${gid}:OpenBroadcastSoftware,,,:/home/obs:/bin/bash" >> /etc/passwd
RUN echo "obs:x:${uid}:" >> /etc/group
RUN echo "obs ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 0440 /etc/sudoers
RUN chown ${uid}:${gid} -R /home/obs

USER obs

ENV HOME /home/obs

CMD ["obs"]