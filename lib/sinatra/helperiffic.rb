require 'sinatra/base'
require 'helperiffic'

module Sinatra
  module Helperiffic
    def self.registered(app)
      app.helpers do
        def hb
          @helper_broker ||= HelperBroker.new(self)
        end
      end
    end
  end
end