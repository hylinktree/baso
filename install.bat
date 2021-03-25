echo Baso Installer 2021/03/25a
rem export GDCA_DOCKER_DNS="--add-host sttl.io:140.92.24.27"
set gitbase=hylinktree
set tgt=basoback_hy
set reposrc=d:\apps\repo
set repodir=/mnt/baso/.repo
docker pull %gitbase%/%tgt%
docker stop %tgt%
docker rm %tgt%
docker run --name %tgt% -d --restart always -v %reposrc%:%repodir% -e REPODIR=%repodir% -p 8603:8603 %gitbase%/%tgt%

