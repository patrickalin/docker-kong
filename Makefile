dcStop:
	@docker-compose stop

dcRm: dcStop
	@docker-compose rm -s -f -v

dcRestart: dcRm dcStart dcLogs

dcStart:
	@docker-compose up -d
	@docker-compose ps 
	@docker-compose logs


dcUp: dcStart

dBuild:
	@docker build .

diUpdate:
	@docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull

dcLogs: 
	@docker-compose logs

dcLog: dcLogs

gitAddVersion:
	git add Dockerfile
	git commit -m "New version Dockerfile"
	git push

dExec:
	docker exec -ti kong bash
