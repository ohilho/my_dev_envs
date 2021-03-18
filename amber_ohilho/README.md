# USE docker-compose and tmux

pytorch 서비스는 shell 위에서 작동하기 때문에 접속하는 순서가
ssh > tmux > docker 순으로 되어야 한다.
ssh > docker > tmux 순으로 되면 복잡해진다.

tmux attach -t ohilho
cd amber_ohilho
docker-compose up -d visdom
