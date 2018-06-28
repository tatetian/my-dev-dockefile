FROM ubuntu:16.04

MAINTAINER Hongliang Tian version: 0.1

# Install essential packages
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl wget iputils-ping
RUN apt-get install -y git tmux
RUN apt-get install -y build-essential

# Install neovim
RUN apt-add-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim
RUN apt-get install -y python-dev python-pip python3-dev python3-pip
RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
RUN update-alternatives --config vi
RUN update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
RUN update-alternatives --config vim
RUN update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
RUN update-alternatives --config editor

# Config neovim
RUN mkdir -p /root/.config/nvim/
COPY config/init.vim /root/.config/nvim/
RUN vim +PlugInstall +qall

# Config git
RUN git config --global user.name   "Tate, Hongliang Tian"
RUN git config --global user.email  "tatetian@gmail.com"
RUN git config --global core.editor "vim"
RUN git config --global credential.helper cache
RUN git config --global color.ui    auto

# Config terminal
COPY config/inputrc /root/.inputrc
COPY config/minttyrc /root/.minttyrc
COPY config/git-prompt.sh /root/.git-prompt.sh
COPY config/bashrc-extra /root/.bashrc-extra
RUN echo "\nsource ~/.bashrc-extra" >> /root/.bashrc
