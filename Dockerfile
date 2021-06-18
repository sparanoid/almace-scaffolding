FROM sparanoid/ruby-node:latest

COPY ./ /opt/amsf/

VOLUME /opt/amsf/

WORKDIR /opt/amsf/

RUN bundle install && yarn install

EXPOSE 4321

ENTRYPOINT ["grunt"]

CMD [ "--help" ]
