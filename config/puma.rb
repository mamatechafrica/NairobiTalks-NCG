# Ultra-minimal Puma config
environment "production"
port 8080
bind "tcp://0.0.0.0:8080"
threads 0, 3
