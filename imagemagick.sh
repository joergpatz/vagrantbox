#!/usr/bin/env bash

# Install latest ImageMagick
apt-get install -y build-essential checkinstall
apt-get build-dep imagemagick -y
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar xzvf ImageMagick.tar.gz
(cd ImageMagick* && ./configure --prefix=/opt/imagemagick && make && checkinstall)
ln -s /opt/imagemagick/bin/animate /usr/bin/
ln -s /opt/imagemagick/bin/compare /usr/bin/
ln -s /opt/imagemagick/bin/composite /usr/bin/
ln -s /opt/imagemagick/bin/conjure /usr/bin/
ln -s /opt/imagemagick/bin/convert /usr/bin/
ln -s /opt/imagemagick/bin/display /usr/bin/
ln -s /opt/imagemagick/bin/identify /usr/bin/
ln -s /opt/imagemagick/bin/import /usr/bin/
ln -s /opt/imagemagick/bin/mogrify /usr/bin/
ln -s /opt/imagemagick/bin/montage /usr/bin/
ln -s /opt/imagemagick/bin/stream /usr/bin/

# checkinstall will allow you to manage the compiled install with dpkg like this.
#dpkg --list | grep imagemagick