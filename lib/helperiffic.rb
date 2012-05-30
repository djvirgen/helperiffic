class HelperBroker
  def initialize(app)
    @app = app
    @helpers = {}
  end
  
  # Lazily-instantiates a helper based on short name
  def get_helper(name)
    @helpers[name] ||= load_helper(name)
  end
  
  # Proxies method calls to helpers
  def method_missing(method_sym, *args, &block)
    helper = get_helper(method_sym)
    helper.send(method_sym, *args, &block)
  end
  
  private
  
  # Factory method for instantiating helpers based on class name
  def load_helper(name)
    class_name = "#{name.to_s.capitalize}Helper".to_sym
    helper = @app.class.const_get(class_name).new
    helper.app = @app if helper.respond_to? :"app="
    helper
  end
end

module Helperiffic
  def app=(app)
    @app = app
  end
  
  def app
    @app
  end
  
  # Delegate missing methods to app
  def method_missing(method_sym, *args, &block)
    app.send(method_sym, *args, &block) if app.respond_to? method_sym
  end
end