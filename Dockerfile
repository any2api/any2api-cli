FROM dockerfile/nodejs

RUN apt-get -y update && apt-get -y install curl nano ruby

RUN npm install any2api-cli -g

CMD ['bash']
