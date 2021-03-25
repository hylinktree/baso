echo Baso Installer 2021/03/25a
set docker_dns=--add-host db.sec.io:192.168.5.27
set gitbase=hylinktree
set docker_mode=-it
set docker_cmd=bach -c "for((;;)); do echo $BASOACT , `date`; sleep 10; done;"

docker network create baso 2> nul

set tgt=basoweb
docker pull %gitbase%/%tgt%
docker stop %tgt% 2> nul
docker rm %tgt% 2> nul
docker run --name %tgt% %docker_mode% -e BASOACT=%tgt% --network baso --restart always %docker_dns% -p 8668:8668 %gitbase%/%tgt% %docker_cmd%

set tgt=basoback_hy
set reposrc=d:\apps\repo
set repodir=/mnt/baso/.repo
docker pull %gitbase%/%tgt%
docker stop %tgt% 2> nul
docker rm %tgt% 2> nul
docker run --name %tgt% %docker_mode% -e BASOACT=%tgt%  --network baso --restart always %docker_dns% -v %reposrc%:%repodir% -e REPODIR=%repodir% -p 8603:8603 %gitbase%/%tgt% %docker_cmd%

set tgt=basoback_sh
docker pull %gitbase%/%tgt%
docker stop %tgt% 2> nul
docker rm %tgt% 2> nul
docker run --name %tgt% %docker_mode% -e BASOACT=%tgt%  --network baso --restart always %docker_dns%  -p 6886:6886 %gitbase%/%tgt% %docker_cmd%

