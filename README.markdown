Helperiffic
===========

Object-oriented helpers for an object-oriented world!

Setting Up
----------

Install the gem

    $ gem install helperiffic
    
Sinatra Classic:

    # blah_app.rb
    require 'sinatra'
    require 'sinatra/helperiffic'
    
    class FooHelper
      def foo
        "called foo"
      end
    end
    
    get '/blah' do
      hb.foo
    end
    
Sinatra Base:

    # blah_app.rb
    require 'sinatra/base'
    require 'helperiffic'
  
    class BlehApp < Sinatra::Base
      register Sinatra::Helperiffic
      
      class FooHelper
        def foo
          "called foo"
        end
      end
      
      get '/blah' do
        hb.foo
      end
    end