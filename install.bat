echo Baso Installer 2021/03/25
set gitbase=hylinktree
set tgt=basoback_hy
set reposrc=d:\apps\repo
set repodir=/mnt/baso/.repo
docker pull %gitbase%/%tgt%
docker stop %tgt%
docker rm %tgt%
docker run --name %tgt% --restart always -v %reposrc%:%repodir% -e REPODIR=%repodir% -p 8603:8603 %gitbase%/%tgt%

