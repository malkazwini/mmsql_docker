# MSSQL CLient (SQLCMD) in a Docker Ephemeral Container 

The ephemeral container will run to execute a single command to Drop a remote Db, the conrainer expects  environment variables to be provided at run. 

## Build the container

clone the repo and: 

docker build -t mssqlclient:latest . 

## Dockerhub
you can pull the pre-built image from dokcer hub

docker pull malkazwini/mssql_docker

 
## Running the container
docker run -e "DbHost=<DB ENDPOINT>" -e "DbPort=<DB PORT> -e "DbUser=<DB USERNAME>" \
 		   -e "DbPassword =<DB PASSWORD>" -e "DbName=<DB NAME>" \ 
 		    -e "DbMode=<EITHER DROP/ALTER DB>" -e "ScriptDebug=<true/flase>" \ mssqlclient:latest


## Contribution 

Feel free to contribute and add more SQL in db_ops.sh

