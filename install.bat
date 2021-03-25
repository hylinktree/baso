echo Baso Installer 2021/03/25a
set docker_dns=--add-host db.pri.io:192.168.1.12 --add-host db.sec.io:192.168.5.27
set gitbase=hylinktree

docker network create baso

set tgt=basoweb
docker pull %gitbase%/%tgt%
docker stop %tgt%
docker rm %tgt%
docker run --name %tgt% -d --network baso --restart always %docker_dns% -p 8668:8668 %gitbase%/%tgt%

set tgt=basoback_hy
set reposrc=d:\apps\repo
set repodir=/mnt/baso/.repo
docker pull %gitbase%/%tgt%
docker stop %tgt%
docker rm %tgt%
docker run --name %tgt% -d --network baso --restart always %docker_dns% -v %reposrc%:%repodir% -e REPODIR=%repodir% -p 8603:8603 %gitbase%/%tgt%

set tgt=basoback_sh
docker pull %gitbase%/%tgt%
docker stop %tgt%
docker rm %tgt%
docker run --name %tgt% -d --network baso --restart always %docker_dns% -v %reposrc%:%repodir% -e REPODIR=%repodir% -p 8603:8603 %gitbase%/%tgt%

