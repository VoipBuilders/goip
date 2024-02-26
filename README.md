## goip, smb, radmin service in docker container
***

Download project

git clone --branch goip-no-aster https://github.com/VoipBuilders/goip.git
cd ./goip

edit (set variables):  
___docker-compose.yaml___  
___.env___  
___security/db.env___  
___security/radmin.env___



exec from cli  
docker compose up 
 
docker compose down

then change docker-compose.yaml again (comment install service) and run  
docker-compose up -d 

***

enjoy
