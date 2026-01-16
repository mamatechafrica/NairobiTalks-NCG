FROM ruby:3.2.3-slim

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs npm && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set without 'development test' && bundle install

COPY . .

ENV RAILS_ENV=production
RUN SECRET_KEY_BASE=1234567890123456 bin/rails assets:precompile

EXPOSE 8080

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080", "-e", "production"]