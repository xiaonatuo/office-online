#!/bin/bash

install_redhat() {
   cp ../office-package/LibreOffice_7_rpm.tar.gz /tmp/LibreOffice_7_rpm.tar.gz && cd /tmp && tar -zxf /tmp/LibreOffice_7_rpm.tar.gz && cd /tmp/LibreOffice_7.1.4.2_Linux_x86-64_rpm/RPMS
   echo $?
   if [ $? -eq 0 ];then
     yum install -y libXext.x86_64
     yum groupinstall -y  "X Window System"
     yum localinstall *.rpm
     echo 'install finshed...'
   else
     echo 'download package error...'
   fi
}

install_ubuntu() {
   cp ../office-package/LibreOffice_7_deb.tar.gz.* /tmp/ && cd /tmp && cat /tmp/LibreOffice_7_deb.tar.gz.* | tar -xz && cd /tmp/LibreOffice_7.1.4.2_Linux_x86-64_deb/DEBS
   echo $?
 if [ $? -eq 0 ];then
     dpkg -i *.deb
     echo 'install finshed...'
  else
    echo 'download package error...'
 fi
}


if [ -f "/etc/redhat-release" ]; then
  install_redhat
else
  install_ubuntu
fi