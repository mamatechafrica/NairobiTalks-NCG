FROM ruby:3.2.3-bullseye

# Install system deps required to build native gems (including pg)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install bundler and dependencies early using the copied Gemfiles
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.20 --no-document \
  && bundle config set without 'development test' \
  && bundle install --jobs 4 --retry 3

# Copy app and precompile assets in production mode
COPY . .
ENV RAILS_ENV=production RACK_ENV=production
RUN SECRET_KEY_BASE=dummy bin/rails assets:precompile

EXPOSE 8080
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
