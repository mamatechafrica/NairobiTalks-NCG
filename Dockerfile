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

EXPOSE ${PORT:-8080}

# Create startup script with port test
RUN echo '#!/bin/bash
set -e

echo "=== RAILWAY STARTUP DEBUG ==="
echo "Current directory: $(pwd)"
echo "Environment variables:"
echo "  PORT=${PORT:-8080}"
echo "  RAILS_ENV=$RAILS_ENV"
echo "  RAILS_MASTER_KEY present: $([ -n "$RAILS_MASTER_KEY" ] && echo "YES" || echo "NO")"

# Create master key if missing
if [ ! -f config/master.key ]; then
    echo "📝 Creating master key..."
    if [ -n "$RAILS_MASTER_KEY" ]; then
        echo "$RAILS_MASTER_KEY" > config/master.key
        chmod 600 config/master.key
        echo "✅ Master key created"
    else
        echo "❌ RAILS_MASTER_KEY environment variable not set"
        exit 1
    fi
fi

echo "🔑 Master key exists: $([ -f config/master.key ] && echo "YES" || echo "NO")"

# Test port binding before starting Rails
TARGET_PORT=${PORT:-8080}
echo "🌍 Will bind to port: $TARGET_PORT"

echo "🚀 Starting Puma on port $TARGET_PORT..."
echo "========================"

exec bundle exec puma -C config/puma.rb -p $TARGET_PORT
' > /app/start.sh && chmod +x /app/start.sh

CMD ["/app/start.sh"]
