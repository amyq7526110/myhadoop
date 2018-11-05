
  cd /usr/local/hadoop

  ./bin/hdfs namenode -format
  ./sbin/start-dfs.sh
  sleep 2
  bin/hdfs dfsadmin -report 
 
   ./bin/hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar wordcount hdfs://nn01:9000/abc /bb
