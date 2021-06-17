FROM sparanoid/ruby-node:latest

COPY ./ /opt/amsf/

WORKDIR /opt/amsf/

RUN bundle install && yarn install

EXPOSE 4321

VOLUME /opt/amsf/

ENTRYPOINT ["grunt"]

CMD [ "--help" ]
