# Conecta Docker Runner

Stupid shell script to run conecta in a docker container.

### How to:

1 - Be sure you have Docker installed (this is important);

2 - Be sure you have the project cloned on your local machine;

3 - Go to the project's folder on your local machine;

4 - `curl https://raw.githubusercontent.com/aceleradora-TW/conecta-docker-runner/master/run.sh | bash`

If everything went well, __Conecta__ is supposed to be running on port `9000`.

### Stopping conecta
The docker container will start detached, which means it will be running in background. To stop it run:

``` sh
docker stop conecta-docker-runner
```


