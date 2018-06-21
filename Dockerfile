FROM ruby:2.4.1

RUN apt-get update && \
    apt-get install -y nodejs \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ADD . /app/
RUN bundle install --deployment --without test
