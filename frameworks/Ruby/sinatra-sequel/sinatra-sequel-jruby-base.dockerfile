FROM techempower/jruby-9.1:0.1

ADD ./ /sinatra-sequel

WORKDIR /sinatra-sequel

ENV THREAD_FACTOR=2

RUN bundle install --jobs=4 --gemfile=/sinatra-sequel/Gemfile --path=/sinatra-sequel/sinatra-sequel/bundle

ENV DBTYPE=mysql
CMD bundle exec torquebox run --io-threads $(( MAX_CONCURRENCY / 2 )) --worker-threads $MAX_CONCURRENCY -b 0.0.0.0 -p 8080 -e production
