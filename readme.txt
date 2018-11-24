
  cd /usr/local/hadoop

  ./bin/hdfs namenode -format
  ./sbin/start-dfs.sh
  sleep 2
  bin/hdfs dfsadmin -report 
 
   ./bin/hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.6.jar wordcount hdfs://nn01:9000/abc /bb
  
      启动zookeeper 

     /usr/local/zookeeper/bin/zkServer.sh start
  
     1）初始化ZK集群
/usr/local/hadoop/bin/hdfs zkfc -formatZK 

   2）在node1，node2，node3上面启动journalnode服务（以node1为例子）
               /usr/local/hadoop/sbin/hadoop-daemon.sh start journalnode 
                jps
3）格式化，先在node1，node2，node3上面启动journalnode才能格式化
 /usr/local/hadoop//bin/hdfs  namenode  -format   
//出现Successfully即为成功
 ls /var/hadoop/
dfs
4）nn02数据同步到本地 /var/hadoop/dfs
cd /var/hadoop/
 ls
 rsync -aSH  nn01:/var/hadoop/  /var/hadoop/
[root@nn02 hadoop]# ls
dfs
5）初始化 JNS
 /usr/local/hadoop/bin/hdfs namenode -initializeSharedEdits
18/09/11 16:26:15 INFO client.QuorumJournalManager: Successfully started new epoch 1        //出现Successfully，成功开启一个节点
6）停止 journalnode 服务（node1，node2，node3）
 /usr/local/hadoop/sbin/hadoop-daemon.sh stop journalnode
stopping journalnode
 jps
29346 Jps
26895 QuorumPeerMain

   1）nn01上面操作
/usr/local/hadoop/sbin/start-all.sh  //启动所有集群
    2）nn02上面操作
 /usr/local/hadoop/sbin/yarn-daemon.sh start resourcemanager
[root@nn01 hadoop]# /usr/local/hadoop/bin/hdfs haadmin -getServiceState nn1
active
[root@nn01 hadoop]# /usr/local/hadoop/bin/hdfs haadmin -getServiceState nn2
standby
[root@nn01 hadoop]# /usr/local/hadoop/bin/yarn rmadmin -getServiceState rm1
active
[root@nn01 hadoop]# /usr/local/hadoop/bin/yarn rmadmin -getServiceState rm2
standby


   (1)
   /usr/local/hadoop/sbin/hadoop-daemon.sh --script ./bin/hdfs start portmap

   /usr/bin/hadoop/sbin/hadoop-daemon.sh  --script ./bin/hdfs start nfs3 


mount -t nfs -o vers=3,proto=tcp,nolock,noatime,sync,noacl 172.16.0.196:/  /mnt/  

  192.168.1.26:/  /mnt/ nfs  vers=3,proto=tcp,nolock,noatime,sync,noacl,_netdev 0 0 

