FROM ruby:3.2.3-slim

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs npm && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set without 'development test' && bundle install

COPY . .

ENV RAILS_ENV=production
RUN SECRET_KEY_BASE=1234567890123456 bin/rails assets:precompile

EXPOSE 8080

# Create a proper start script (use heredoc so Dockerfile parser won't treat shell lines as Docker instructions)
RUN cat > /usr/local/bin/start.sh <<'SH'
#!/bin/bash
set -e

# If RAILS_MASTER_KEY is provided at runtime, write it to config/master.key
if [ -n "$RAILS_MASTER_KEY" ]; then
	mkdir -p config
	echo "$RAILS_MASTER_KEY" > config/master.key
	chmod 600 config/master.key
fi

exec bundle exec rails server -b 0.0.0.0 -p 8080 -e production
SH

RUN chmod +x /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]