#!/bin/bash 

  cd /root
  tar -zxf zookeeper-3.4.10.tar.gz
  mv zookeeper-3.4.10  /usr/local/zookeeper
  cd /usr/local/zookeeper/conf
  mv zoo_sample.cfg zoo.cfg
  mkdir /tmp/zookeeper
  j=1
  for i  in `awk '{print $2}' /etc/hosts | tail -4`
  do
    if [ $j -eq 4 ];then
    
      sed -i '$a  \server.'$j'='$i':2888:3888:observer' zoo.cfg

    else

       sed -i '$a  \server.'$j'='$i':2888:3888'  zoo.cfg
    fi

    let "j++"

  done
  
