#!/bin/bash

#This script monitors memory , if memory exceeds value like 80% , 70% , 90% (You can modify it), then you can make specific commands or scripts

checkMemory(){

if [ $(free -m| grep  Mem | awk '{ print int($3/$2*100) }') -gt "80" ]

then

        sleep 3

        if [ $(free -m| grep  Mem | awk '{ print int($3/$2*100) }') -gt "85" ]

        then

                        mydate=$(date)
                        echo "$mydate restarting httpd" >> /tmp/memory_log
                        #echo "$processes" >> /tmp/memory_log
                        systemctl restart httpd
                        sleep 100


        fi




        if [ $(free -m| grep  Mem | awk '{ print int($3/$2*100) }') -gt "80" ]i

        then

                        mydate=$(date)                   
                        echo "$mydate restarting mysqld" >> /tmp/memory_log                        
                        systemctl restart mysqld
                        sleep 100


        fi

fi

}

while true
    do
    checkMemory
    sleep 30
done
