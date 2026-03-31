require 'roda'
require "/Users/avi/code/2025/april/roda-vite-prod/lib/roda/plugins/vite"

# Monkeypatch to disable linting
#
# Currently 304 responses from Vite seem to include a Content-Length header, which should be fixed in vite-roda
# That triggers from Rack:
#    Rack::Lint::LintError at /build/@vite/client
#    content-length header found in 304 response, not allowed (Rack::Lint::LintError)
module Rack
  class Lint
    def call(env=nil)
      @app.call(env)
    end
  end
end

require_relative 'app'
run App.freeze.app
