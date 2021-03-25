#!/bin/bash
echo Baso Installer 2021-03-25
docker pull hylinktree/basoback_hy
docker stop basoback_hy
docker rm basoback_hy
docker run --name basoback_hy --restart always -p 8603:8603 hylinktree/basoback_hy

