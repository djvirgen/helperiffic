require 'sinatra/base'
require 'helperiffic'

module Sinatra
  module Helperiffic
    def self.registered(app)
      app.helpers do
        def helper_broker
          @helper_broker ||= HelperBroker.new(self)
        end
        
        # Proxies to helper broker
        def method_missing(method_sym, *args, &block)
          helper_broker.send(method_sym, *args, &block)
        end
      end
    end
  end
end