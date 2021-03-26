#!/bin/bash
export GITBASE=hylinktree
pwd=`pwd`
cd basepy38
bash mk.sh
cd ../basejav11
bash mk.sh
cd ../../basoweb
bash build.sh
bash mk.sh
cd ../andesite
bash mk.sh
cd ../L19_backend
bash mk.sh
cd $pwd

