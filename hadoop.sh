#!/bin/bash 

  cd /root
  tar -zxf hadoop-2.7.6.tar.gz
  mv hadoop-2.7.6  /usr/local/hadoop
  cd /usr/local/hadoop/etc/hadoop 
  sed -i '1a HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"'  hadoop-env.sh
  sed -i '1a    JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-11.b12.el7.x86_64/jre/"'  hadoop-env.sh



 
