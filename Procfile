web: bin/rails db:prepare && bundle exec puma -C config/puma.rb -b tcp://0.0.0.0:${PORT}

# Local convenience: run with `make serve` or `foreman start` to use this Procfile locally
local: bin/rails server -p ${PORT:-3001} -b 127.0.0.1