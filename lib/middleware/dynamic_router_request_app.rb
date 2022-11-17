require "rack"

module Middleware
  class DynamicRouterRequestApp
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      request_body = JSON.parse(request.body.read, symbolize_names: true)
      if request_body[:request][:type] == "IntentRequest"
        intent_name = request_body[:request][:intent][:name]
        env["PATH_INFO"] = route_for(intent_name)
      end
      @app.call(env)
    end

    private

    def route_for(intent)
      if intent == "LogFoodIntent"
        "/foods"
      else
        "/alexa"
      end
    end
  end
end
