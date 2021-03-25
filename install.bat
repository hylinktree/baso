echo Baso Installer 2021/03/25
gitbase=hylinktree
tgt=basoback_hy
reposrc=d:\apps\repo
repodir=/mnt/baso/.repo
docker pull %gitbase%/%tgt%
docker stop %tgt%
docker rm %tgt%
docker run --name %tgt% --restart always -v %reposrc%:%repodir% -e REPODIR=%repodir% -p 8603:8603 %gitbase%/%tgt%

