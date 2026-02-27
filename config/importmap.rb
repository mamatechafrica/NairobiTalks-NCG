# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "fireworks-js", to: "https://ga.jspm.io/npm:fireworks-js@2.10.0/dist/index.es.js"
pin "trix", to: "https://cdn.jsdelivr.net/npm/trix@2.0.0/dist/trix.umd.min.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
