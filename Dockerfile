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

# Create master key file from environment
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}
RUN echo "${RAILS_MASTER_KEY}" > config/master.key && chmod 600 config/master.key

# Precompile assets
ENV RAILS_ENV=production
RUN SECRET_KEY_BASE=dummy bin/rails assets:precompile

# Expose port
EXPOSE 8080

# Simple startup command
CMD ["bundle", "exec", "puma", "-p", "8080"]
