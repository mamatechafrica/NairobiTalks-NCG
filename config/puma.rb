# Minimal Puma config for Railway
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

port 8080
bind "tcp://0.0.0.0:8080"
environment "production"

plugin :tmp_restart
