# config/puma.rb - Puma config (compatible with Fly.io)

# Environment (also respect ENV for flexibility)
environment ENV.fetch("RAILS_ENV") { "production" }

# Threads: 0,3 is very low — bump for better concurrency (Tailwind/Hotwire apps benefit)
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Optional: workers if you scale horizontally later
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Other defaults are fine
preload_app!
