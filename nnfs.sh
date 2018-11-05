#!/bin/bash

  cd /usr/local/hadoop

  ./bin/hdfs namenode -format
  ./sbin/start-dfs.sh
  sleep 2
  bin/hdfs dfsadmin -report 
 
