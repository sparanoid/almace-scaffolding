FROM sparanoid/ruby-node:latest

COPY . /app

VOLUME /app

WORKDIR /app

RUN bundle install && yarn install

EXPOSE 4321

ENTRYPOINT ["grunt"]

CMD [ "--help" ]
