#!/bin/bash


   getstatus(){

     exec  9<>/dev/tcp/$1/2181 2>/dev/null
     echo stat >&9
     MODE=$(cat <&9 | grep -Po "(?<=Mode:).*")
     exec 9<&-
     echo ${MODE:-NULL}
   }

   for i in zoo-000{1..3} observer4

   do
      echo -ne "${i}\t"

      getstatus ${i}

   done   
