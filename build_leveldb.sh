#!/bin/bash
#download the POWER version of leveldb
        git clone git://github.com/ibmsoe/leveldb.git
        git clone https://github.com/ibmsoe/leveldbjni.git
        export SNAPPY_HOME=/usr/lib
        export LEVELDB_HOME=`cd leveldb; pwd`
        export LEVELDBJNI_HOME=`cd leveldbjni; pwd`
        export LIBRARY_PATH=${SNAPPY_HOME}
        cd ${LEVELDB_HOME}
        export C_INCLUDE_PATH=${LIBRARY_PATH}
        export CPLUS_INCLUDE_PATH=${LIBRARY_PATH}
        git apply ../leveldbjni/leveldb.patch
        make libleveldb.a
        #Now use maven to build and update the local maven repository with ppc version of
        #leveldbjni.
        cd ${LEVELDBJNI_HOME}
        mvn clean install -DskipTests -P download -Plinux64,all
        cd ..
        #cleanup
 rm -rf ${LEVELDBJNI_HOME}
 rm -rf ${LEVELDB_HOME}
