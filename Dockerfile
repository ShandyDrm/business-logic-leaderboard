FROM ruby:3.1.3

WORKDIR /myapp
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . .

EXPOSE 5001

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "5001"]
