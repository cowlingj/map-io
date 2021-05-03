FROM archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S base-devel --noconfirm
ARG user=arch
RUN useradd -m ${user}
RUN echo "${user} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/${user}
USER ${user}
