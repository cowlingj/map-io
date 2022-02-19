FROM ubuntu

ARG user=ubuntu
RUN useradd -m ${user}
RUN echo "${user} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/${user}
USER ${user}
