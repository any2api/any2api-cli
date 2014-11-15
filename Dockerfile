FROM dockerfile/nodejs

RUN apt-get -y update && apt-get -y install nano ruby

RUN npm install any2api-cli -g

RUN any2api install scanner all
RUN any2api install invoker all
RUN any2api install generator all

CMD bash
