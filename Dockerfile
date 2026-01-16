FROM ruby:3.2.3-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev nodejs npm && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set without 'development test' && bundle install

COPY . .

# Create config/master.key file at runtime (not build time)
ENV RAILS_ENV=production
RUN SECRET_KEY_BASE=1234567890123456 bin/rails assets:precompile

EXPOSE 8080

# Start script that creates master key and runs server
RUN echo '#!/bin/bash
set -e

# Create master key from environment at runtime
if [ -n "$RAILS_MASTER_KEY" ]; then
    echo "$RAILS_MASTER_KEY" > config/master.key
    chmod 600 config/master.key
fi

# Start Rails server
exec bundle exec rails server -b 0.0.0.0 -p 8080 -e production
' > /app/start.sh && chmod +x /app/start.sh

CMD ["/app/start.sh"]