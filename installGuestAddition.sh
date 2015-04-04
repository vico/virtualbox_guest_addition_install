#!/bin/bash
version=$1

if [ -z "$version" ]
then
  echo "Usage: $0 <version>"
  echo "  Example: $0 4.3.26"
  exit 1
fi

saved_dir=/tmp
file_name=VBoxGuestAdditions_${version}.iso
mount_dir=/media/VirtualBoxGuestAdditions
vbox_url=http://download.virtualbox.org/virtualbox

mkdir -p $mount_dir

if [ ! -e $saved_dir/$file_name ]
then
  wget -P $saved_dir $vbox_url/${version}/$file_name
fi

sudo mount -o loop,ro $file_name $mount_dir
sudo sh $mount_dir/VBoxLinuxAdditions.run 
