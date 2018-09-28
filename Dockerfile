FROM ruby:2.3.1

RUN apt-get update && \
    apt-get install -y nodejs \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --deployment --without test
RUN sed -i -e 's/ruby2.3/ruby/g' vendor/bundle/ruby/2.3.0/bin/*

ADD . /app/
