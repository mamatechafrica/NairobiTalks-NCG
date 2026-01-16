FROM ruby:3.2.3-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev nodejs npm && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.20 && bundle config set without 'development test' && bundle install

COPY . .

# Set production environment and precompile assets
ENV RAILS_ENV=production RACK_ENV=production
RUN RAILS_MASTER_KEY=dummy SECRET_KEY_BASE=dummy bin/rails assets:precompile

EXPOSE 8080

# Simple Rails server start
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "8080"]