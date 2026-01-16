FROM ruby:3.2.3-bullseye

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev nodejs npm \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.20 && \
    bundle config set without 'development test' && \
    bundle install

# Copy app
COPY . .

# Create master key file from build argument
ARG RAILS_MASTER_KEY
RUN echo "${RAILS_MASTER_KEY}" > config/master.key && chmod 600 config/master.key

# Precompile assets  
ENV RAILS_ENV=production RACK_ENV=production
RUN SECRET_KEY_BASE=dummy bin/rails assets:precompile

# Expose port
EXPOSE 8080

# Test script to verify Rails can start
RUN echo '#!/bin/bash
echo "Testing Rails configuration..."
echo "Rails environment: $(bundle exec rails runner "puts Rails.env")"
echo "Master key present: $([ -f config/master.key ] && echo "YES" || echo "NO")"
echo "Database URL present: $([ -n "$DATABASE_URL" ] && echo "YES" || echo "NO")"
' > /app/test.sh && chmod +x /app/test.sh

# Health check script
RUN echo '#!/bin/bash
echo "Starting health check..."
curl -f http://localhost:8080/up || echo "Health check failed"
' > /app/healthcheck.sh && chmod +x /app/healthcheck.sh

# Simple Puma start
CMD ["bundle", "exec", "puma", "-p", "8080", "-e", "production"]