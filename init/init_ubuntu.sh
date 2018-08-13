#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

sudo apt-get update

sudo apt-get install -y \
  nodejs \
  g++ \
  build-essential \
  git \
  python-setuptools \
  ruby \
  linux-image-extra-$(uname -r) \
  docker.io \
  python-pip \
  lynx \
  mongodb-clients \
  default-jre \
  vim \
  tree \
  sox \
  vorbis-tools \
  zsh \
  git-core \
  apt-transport-https \
  ca-certificates

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

#The Ultimate Vim Distribution
curl http://j.mp/spf13-vim3 -L -o - | sh

sudo pip install "docker-py==1.9"
sudo pip install docker-compose

sudo usermod -aG docker ubuntu

sudo npm install -g grunt-cli
sudo npm install -g jshint
sudo npm install -g jscs
sudo npm install -g eslint
sudo npm install -g less
sudo npm install -g nodemon
sudo npm install -g mongodb
sudo npm install -g mongoose
sudo npm install -g js-beautify

# tmux v2.3 installation steps for Ubuntu [various OS versions]
sudo apt-get update -yqqu
sudo add-apt-repository -yu ppa:pi-rho/dev
sudo apt-get update -yqqu
sudo apt-get install -yqqu python-software-properties software-properties-common
#sudo apt-get install -yqq tmux-next=2.3~20160913~bzr3547+20-1ubuntu1~ppa0~ubuntu16.04.1
# sudo apt-get install -yqq tmux-next=2.3~20160913~bzr3547+20-1ubuntu1~ppa0~ubuntu15.10.1
# sudo apt-get install -yqq tmux-next=2.3~20160913~bzr3547+20-1ubuntu1~ppa0~ubuntu15.04.1
 sudo apt-get install -yqq tmux-next=2.3~20160913~bzr3547+20-1ubuntu1~ppa0~ubuntu14.04.1
# sudo apt-get install -yqq tmux-next=2.3~20160913~bzr3547+20-1ubuntu1~ppa0~ubuntu12.04.1
tmux-next -V

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

chsh -s `which zsh`
sudo shutdown -r 0

exit 0
