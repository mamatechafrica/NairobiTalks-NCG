# config/puma.rb - Railway-friendly Puma config

# Respect Railway's dynamic PORT (fallback for local)
port ENV.fetch("PORT") { 8080 }

# Bind to all interfaces on that port
bind "tcp://0.0.0.0:#{ENV.fetch("PORT") { 8080 }}"

# Environment (also respect ENV for flexibility)
environment ENV.fetch("RAILS_ENV") { "production" }

# Threads: 0,3 is very low — bump for better concurrency (Tailwind/Hotwire apps benefit)
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Optional: workers if you scale horizontally later
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Other defaults are fine
preload_app!
