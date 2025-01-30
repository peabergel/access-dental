# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "preline", to: "https://cdn.jsdelivr.net/npm/preline@2.5.0/dist/preline.min.js"
pin "process" # @2.1.0
pin "stimulus-use" # @0.52.3
pin "@stimulus-components/notification", to: "@stimulus-components--notification.js" # @3.0.0
pin "@stimulus-components/scroll-reveal", to: "@stimulus-components--scroll-reveal.js" # @4.0.0
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.11
pin "sortablejs" # @1.15.6
pin "animejs" # @3.2.2
pin "mapbox-gl" # @3.9.3
pin "simple-parallax-js" # @6.0.1
pin "react" # @19.0.0
