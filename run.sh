rm -f ./_conecta_image.docker

printf "FROM ruby:2.3.1\n\
RUN mkdir -p /usr/app\n\
WORKDIR /usr/app\n\
RUN apt-get -qq update\n\
RUN apt-get -qq -y install libpq-dev postgresql-server-dev-9.4\n\
COPY Gemfile /usr/app\n\
COPY Gemfile.lock /usr/app\n\
RUN bundle install" > ./_conecta_image.docker

docker build -f ./_conecta_image.docker -t dockerized-conecta:latest . && 

rm ./_conecta_image.docker &&

docker run \
	-d \
	--volume $(pwd)/app:/usr/app/app \
	--volume $(pwd)/config:/usr/app/config \
	--volume $(pwd)/config.ru:/usr/app/config.ru \
	--volume $(pwd)/config.rb:/usr/app/config.rb \
	--name 'conecta-docker-runner' \
	--publish 9000:9000 \
	dockerized-conecta:latest \
		shotgun --host 0.0.0.0 --port 9000 config.ru